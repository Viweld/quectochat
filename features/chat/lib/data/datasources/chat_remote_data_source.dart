import 'package:chat/data/dto/message_dto.dart';
import 'package:shared_domain/shared_domain.dart';

/// Remote chat / messages data access.
abstract interface class ChatRemoteDataSource {
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

  Stream<bool> get typingStatusStream;
}
