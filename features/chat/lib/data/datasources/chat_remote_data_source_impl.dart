import 'dart:async';
import 'dart:developer';

import 'package:chat/data/datasources/chat_remote_data_source.dart';
import 'package:chat/data/datasources/table_keys.dart';
import 'package:chat/data/dto/message_dto.dart';
import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: ChatRemoteDataSource)
final class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  ChatRemoteDataSourceImpl() : _client = Supabase.instance.client;

  final SupabaseClient _client;

  static const int _messagesPaginationLimit = 20;

  RealtimeChannel? _incomingChannel;
  RealtimeChannel? _typingChannel;

  final StreamController<bool> _typingStatusController = StreamController<bool>.broadcast();

  String get _currentUserId => _client.auth.currentUser?.id ?? '';

  @override
  Future<Paginated<MessageDto>> getChatMessages({
    required String interlocutorId,
    String? lastMessageId,
  }) async {
    const int limit = _messagesPaginationLimit;
    final String chatId = DeterministicId.fromParts(<String>[interlocutorId, _currentUserId]);

    PostgrestTransformBuilder<PostgrestList> query = _client
        .from(TableKeys.messages)
        .select()
        .eq(TableKeys.messageChatId, chatId)
        .order(TableKeys.messageCreatedAt, ascending: true)
        .limit(limit + 1);

    if (lastMessageId != null) {
      final Map<String, dynamic>? cursor = await _client
          .from(TableKeys.messages)
          .select()
          .eq(TableKeys.messageId, lastMessageId)
          .maybeSingle();
      final String? cursorCreatedAt = cursor?[TableKeys.messageCreatedAt] as String?;
      if (cursorCreatedAt != null) {
        query = _client
            .from(TableKeys.messages)
            .select()
            .eq(TableKeys.messageChatId, chatId)
            .gt(TableKeys.messageCreatedAt, cursorCreatedAt)
            .order(TableKeys.messageCreatedAt, ascending: true)
            .limit(limit + 1);
      }
    }

    final List<Map<String, dynamic>> rows = await query;
    final bool hasNext = rows.length > limit;
    final List<Map<String, dynamic>> page = hasNext ? rows.sublist(0, limit) : rows;

    return Paginated<MessageDto>(hasNext: hasNext, result: page.map(MessageDto.fromJson));
  }

  @override
  Future<MessageDto> sendMessage({
    required String interlocutorId,
    required String content,
    required String messageType,
  }) async {
    final MessageDto payload = MessageDto(
      id: '',
      chatId: DeterministicId.fromParts(<String>[_currentUserId, interlocutorId]),
      fromId: _currentUserId,
      toId: interlocutorId,
      content: content,
      type: messageType,
      createdAt: DateTime.now().toUtc(),
      deliveredAt: null,
      readAt: null,
    );

    try {
      final Map<String, dynamic> inserted = await _client
          .from(TableKeys.messages)
          .insert(payload.toJson())
          .select()
          .single();
      return MessageDto.fromJson(inserted);
    } on Object catch (cause, stackTrace) {
      Error.throwWithStackTrace(
        ServerException(
          context: const RequestContext(operation: 'chat.sendMessage'),
          cause: cause,
        ),
        stackTrace,
      );
    }
  }

  @override
  Stream<Set<MessageDto>> getAddedModifiedMessagesStream({required String interlocutorId}) {
    final String chatId = DeterministicId.fromParts(<String>[interlocutorId, _currentUserId]);

    return _client
        .from(TableKeys.messages)
        .stream(primaryKey: <String>[TableKeys.messageId])
        .eq(TableKeys.messageChatId, chatId)
        .order(TableKeys.messageCreatedAt, ascending: true)
        .map((SupabaseStreamEvent rows) => rows.map(MessageDto.fromJson).toSet());
  }

  @override
  Future<void> markAsRead({required String interlocutorId}) async {
    final String chatId = DeterministicId.fromParts(<String>[interlocutorId, _currentUserId]);
    final String now = DateTime.now().toUtc().toIso8601String();

    await _client
        .from(TableKeys.messages)
        .update(<String, Object?>{TableKeys.messageDeliveredAt: now})
        .eq(TableKeys.messageChatId, chatId)
        .eq(TableKeys.messageFromId, interlocutorId)
        .isFilter(TableKeys.messageDeliveredAt, null);

    await _client
        .from(TableKeys.messages)
        .update(<String, Object?>{TableKeys.messageReadAt: now})
        .eq(TableKeys.messageChatId, chatId)
        .eq(TableKeys.messageFromId, interlocutorId)
        .isFilter(TableKeys.messageReadAt, null);
  }

  @override
  Future<void> markIncomingMessagesDelivered() async {
    if (_currentUserId.isEmpty) return;

    final String now = DateTime.now().toUtc().toIso8601String();
    await _client
        .from(TableKeys.messages)
        .update(<String, Object?>{TableKeys.messageDeliveredAt: now})
        .eq(TableKeys.messageToId, _currentUserId)
        .isFilter(TableKeys.messageDeliveredAt, null);
  }

  @override
  Future<void> startIncomingMessagesWatcher() async {
    if (_incomingChannel != null || _currentUserId.isEmpty) return;

    await markIncomingMessagesDelivered();

    _incomingChannel = _client
        .channel('incoming-messages-$_currentUserId')
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          schema: 'public',
          table: TableKeys.messages,
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: TableKeys.messageToId,
            value: _currentUserId,
          ),
          callback: (_) {
            unawaited(_markIncomingDeliveredSafely());
          },
        )
        .subscribe();
  }

  @override
  Future<void> stopIncomingMessagesWatcher() async {
    await _incomingChannel?.unsubscribe();
    _incomingChannel = null;
  }

  @override
  Stream<bool> get typingStatusStream => _typingStatusController.stream;

  @override
  Future<void> startTypingChannel({required String interlocutorId}) async {
    if (_currentUserId.isEmpty) return;
    await stopTypingChannel();

    final String chatId = DeterministicId.fromParts(<String>[interlocutorId, _currentUserId]);

    _typingChannel = _client
        .channel('typing-$chatId')
        .onBroadcast(
          event: 'typing',
          callback: (Map<String, dynamic> payload) {
            final Object? nested = payload['payload'];
            final Map<String, dynamic> data = nested is Map<String, dynamic> ? nested : payload;
            final String? fromId = data['fromId'] as String?;
            if (fromId != interlocutorId) return;
            final bool isTyping = data['isTyping'] == true;
            if (!_typingStatusController.isClosed) {
              _typingStatusController.add(isTyping);
            }
          },
        )
        .subscribe();
  }

  @override
  Future<void> stopTypingChannel() async {
    final RealtimeChannel? channel = _typingChannel;
    _typingChannel = null;
    if (channel == null) return;

    try {
      await channel.unsubscribe();
      await _client.removeChannel(channel);
    } on Object catch (error, stackTrace) {
      log(
        'Failed to stop typing channel',
        name: 'ChatRemoteDataSource',
        error: error,
        stackTrace: stackTrace,
      );
    }

    if (!_typingStatusController.isClosed) {
      _typingStatusController.add(false);
    }
  }

  @override
  Future<void> sendTypingStatus({required bool isTyping}) async {
    final RealtimeChannel? channel = _typingChannel;
    if (channel == null || _currentUserId.isEmpty) return;

    try {
      await channel.sendBroadcastMessage(
        event: 'typing',
        payload: <String, Object?>{'fromId': _currentUserId, 'isTyping': isTyping},
      );
    } on Object catch (error, stackTrace) {
      log(
        'Failed to send typing status',
        name: 'ChatRemoteDataSource',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _markIncomingDeliveredSafely() async {
    try {
      await markIncomingMessagesDelivered();
    } on Object catch (error, stackTrace) {
      log(
        'Failed to mark incoming messages delivered',
        name: 'ChatRemoteDataSource',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}
