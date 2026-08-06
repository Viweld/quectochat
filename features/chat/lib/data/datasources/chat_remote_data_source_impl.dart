import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:math' show Random;
import 'dart:typed_data';

import 'package:chat/data/datasources/chat_remote_data_source.dart';
import 'package:chat/data/datasources/table_keys.dart';
import 'package:chat/data/dto/message_dto.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as path;
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

    // Newest-first page; [lastMessageId] is the oldest already loaded message (load older).
    PostgrestTransformBuilder<PostgrestList> query = _client
        .from(TableKeys.messages)
        .select()
        .eq(TableKeys.messageChatId, chatId)
        .order(TableKeys.messageCreatedAt, ascending: false)
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
            .lt(TableKeys.messageCreatedAt, cursorCreatedAt)
            .order(TableKeys.messageCreatedAt, ascending: false)
            .limit(limit + 1);
      }
    }

    final List<Map<String, dynamic>> rows = await query;
    final bool hasNext = rows.length > limit;
    final List<Map<String, dynamic>> pageNewestFirst = hasNext ? rows.sublist(0, limit) : rows;
    // UI / merge keep chronological ascending (oldest → newest).
    final List<Map<String, dynamic>> page = pageNewestFirst.reversed.toList();

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
  Future<MessageDto> sendImageMessage({
    required String interlocutorId,
    required String filePath,
  }) async {
    final String chatId = DeterministicId.fromParts(<String>[_currentUserId, interlocutorId]);

    try {
      final _PreparedChatImage prepared = await _prepareImageForUpload(filePath);
      final String objectPath =
          '$chatId/${DateTime.now().toUtc().microsecondsSinceEpoch}_'
          '${Random().nextInt(1 << 32)}${prepared.extension}';

      await _client.storage
          .from(_chatMediaBucket)
          .uploadBinary(
            objectPath,
            prepared.bytes,
            fileOptions: FileOptions(contentType: prepared.contentType),
          );

      final String publicUrl = _client.storage.from(_chatMediaBucket).getPublicUrl(objectPath);
      return sendMessage(interlocutorId: interlocutorId, content: publicUrl, messageType: 'image');
    } on Object catch (cause, stackTrace) {
      Error.throwWithStackTrace(
        ServerException(
          context: const RequestContext(operation: 'chat.sendImageMessage'),
          cause: cause,
        ),
        stackTrace,
      );
    }
  }

  static const String _chatMediaBucket = 'chat-media';

  /// Compress only when the source exceeds this size.
  static const int _imageCompressThresholdBytes = 400 * 1024;

  static const int _compressedMaxSide = 1280;
  static const int _compressedJpegQuality = 70;

  Future<_PreparedChatImage> _prepareImageForUpload(String filePath) async {
    final File source = File(filePath);
    final int sourceSize = await source.length();
    final String extension = path.extension(filePath).toLowerCase();

    if (sourceSize <= _imageCompressThresholdBytes) {
      final String safeExtension = switch (extension) {
        '.png' => '.png',
        '.webp' => '.webp',
        '.jpg' || '.jpeg' || '' => '.jpg',
        _ => '.jpg',
      };
      return _PreparedChatImage(
        bytes: await source.readAsBytes(),
        extension: safeExtension,
        contentType: _contentTypeForExtension(safeExtension),
      );
    }

    final Uint8List? compressed = await FlutterImageCompress.compressWithFile(
      filePath,
      minWidth: _compressedMaxSide,
      minHeight: _compressedMaxSide,
      quality: _compressedJpegQuality,
    );

    if (compressed == null || compressed.isEmpty) {
      return _PreparedChatImage(
        bytes: await source.readAsBytes(),
        extension: '.jpg',
        contentType: 'image/jpeg',
      );
    }

    return _PreparedChatImage(bytes: compressed, extension: '.jpg', contentType: 'image/jpeg');
  }

  static String _contentTypeForExtension(String extension) {
    return switch (extension) {
      '.png' => 'image/png',
      '.webp' => 'image/webp',
      _ => 'image/jpeg',
    };
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

  @override
  Future<void> markChatActive({required String interlocutorId}) async {
    if (_currentUserId.isEmpty || interlocutorId.isEmpty) return;

    await _client.from(TableKeys.activeChats).upsert(<String, Object?>{
      TableKeys.activeChatUserId: _currentUserId,
      TableKeys.activeChatInterlocutorId: interlocutorId,
      TableKeys.activeChatUpdatedAt: DateTime.now().toUtc().toIso8601String(),
    }, onConflict: '${TableKeys.activeChatUserId},${TableKeys.activeChatInterlocutorId}');
  }

  @override
  Future<void> clearActiveChat() async {
    if (_currentUserId.isEmpty) return;

    await _client
        .from(TableKeys.activeChats)
        .delete()
        .eq(TableKeys.activeChatUserId, _currentUserId);
  }

  @override
  Future<void> clearChat({required String interlocutorId}) async {
    final String chatId = DeterministicId.fromParts(<String>[_currentUserId, interlocutorId]);

    try {
      await _client.from(TableKeys.messages).delete().eq(TableKeys.messageChatId, chatId);
    } on Object catch (cause, stackTrace) {
      Error.throwWithStackTrace(
        ServerException(
          context: const RequestContext(operation: 'chat.clearChat'),
          cause: cause,
        ),
        stackTrace,
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

final class _PreparedChatImage {
  const _PreparedChatImage({
    required this.bytes,
    required this.extension,
    required this.contentType,
  });

  final Uint8List bytes;
  final String extension;
  final String contentType;
}
