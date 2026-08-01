import 'package:chat/data/dto/message_dto.dart';
import 'package:shared_domain/shared_domain.dart';

/// Remote chat / messages data access.
abstract interface class ChatRemoteDataSource {
  /// Newest-first history page. [lastMessageId] = oldest loaded message (older page).
  Future<Paginated<MessageDto>> getChatMessages({
    required String interlocutorId,
    String? lastMessageId,
  });

  Future<MessageDto> sendMessage({
    required String interlocutorId,
    required String content,
    required String messageType,
  });

  Stream<Set<MessageDto>> getAddedModifiedMessagesStream({required String interlocutorId});

  Future<void> markAsRead({required String interlocutorId});

  Future<void> markIncomingMessagesDelivered();

  Future<void> startIncomingMessagesWatcher();

  Future<void> stopIncomingMessagesWatcher();

  Future<void> startTypingChannel({required String interlocutorId});

  Future<void> stopTypingChannel();

  Future<void> sendTypingStatus({required bool isTyping});

  /// Marks [interlocutorId] as the chat currently open by this user (push suppression).
  Future<void> markChatActive({required String interlocutorId});

  /// Clears the active-chat heartbeat row for this user.
  Future<void> clearActiveChat();

  Stream<bool> get typingStatusStream;
}
