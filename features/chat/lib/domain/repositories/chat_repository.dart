import 'dart:async';

import 'package:chat/domain/entities/message.dart';
import 'package:shared_domain/shared_domain.dart';

/// Chat repository stream / operation failures without UI strings.
sealed class ChatRepositoryError {
  const ChatRepositoryError();
}

/// Failure while loading paginated messages.
final class ChatLoadMessagesFailure extends ChatRepositoryError {
  const ChatLoadMessagesFailure();
}

/// Failure while sending a message.
final class ChatSendMessageFailure extends ChatRepositoryError {
  const ChatSendMessageFailure();
}

/// Failure while marking messages as read.
final class ChatMarkAsReadFailure extends ChatRepositoryError {
  const ChatMarkAsReadFailure();
}

/// Generic chat repository failure (e.g. stream subscription).
final class ChatRepositoryGenericFailure extends ChatRepositoryError {
  const ChatRepositoryGenericFailure();
}

/// Subscription to messages stream.
typedef ChatMessagesSubscription = StreamSubscription<Iterable<Message>>;

/// Subscription to errors stream.
typedef ChatErrorsSubscription = StreamSubscription<ChatRepositoryError>;

/// Chat repository.
abstract interface class ChatRepository {
  Future<void> close();

  ChatMessagesSubscription subscribeEvents(void Function(Iterable<Message>) listener);

  ChatErrorsSubscription subscribeErrors(void Function(ChatRepositoryError) listener);

  Future<void> initialize({required String interlocutorId});

  Future<void> markAsRead({required String interlocutorId});

  Future<void> startDeliveryTracking();

  Future<void> stopDeliveryTracking();

  Future<void> cleanup();

  Future<Paginated<Message>> getChatMessages({
    required String interlocutorId,
    String? lastMessageId,
  });

  Future<void> sendMessage({
    required String interlocutorId,
    required String content,
    required MessageContentType type,
  });
}
