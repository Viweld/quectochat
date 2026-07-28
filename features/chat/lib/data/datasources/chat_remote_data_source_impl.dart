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
      isViewed: false,
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
  Future<void> markAsViewed({required String interlocutorId}) async {
    final String chatId = DeterministicId.fromParts(<String>[interlocutorId, _currentUserId]);

    await _client
        .from(TableKeys.messages)
        .update(<String, Object?>{TableKeys.messageIsViewed: true})
        .eq(TableKeys.messageChatId, chatId)
        .eq(TableKeys.messageFromId, interlocutorId)
        .eq(TableKeys.messageIsViewed, false);
  }
}
