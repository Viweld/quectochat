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

/// Failure while clearing chat history.
final class ChatClearChatFailure extends ChatRepositoryError {
  const ChatClearChatFailure();
}

/// Generic chat repository failure (e.g. stream subscription).
final class ChatRepositoryGenericFailure extends ChatRepositoryError {
  const ChatRepositoryGenericFailure();
}

/// Subscription to messages stream.
typedef ChatMessagesSubscription = StreamSubscription<Iterable<Message>>;

/// Subscription to errors stream.
typedef ChatErrorsSubscription = StreamSubscription<ChatRepositoryError>;

/// Subscription to interlocutor typing status.
typedef ChatTypingSubscription = StreamSubscription<bool>;

/// Subscription to chat-cleared notifications.
typedef ChatClearedSubscription = StreamSubscription<void>;

/// Chat repository.
abstract interface class ChatRepository {
  Future<void> close();

  ChatMessagesSubscription subscribeEvents(void Function(Iterable<Message>) listener);

  ChatErrorsSubscription subscribeErrors(void Function(ChatRepositoryError) listener);

  ChatTypingSubscription subscribeInterlocutorTyping(void Function(bool isTyping) listener);

  ChatClearedSubscription subscribeChatCleared(void Function() listener);

  Future<void> initialize({required String interlocutorId});

  Future<void> markAsRead({required String interlocutorId});

  Future<void> setTypingStatus({required bool isTyping});

  Future<void> startDeliveryTracking();

  Future<void> stopDeliveryTracking();

  Future<void> cleanup();

  /// Stops heartbeat and clears `active_chats` (e.g. app went to background).
  Future<void> pauseActiveChatPresence();

  /// Restarts heartbeat after [pauseActiveChatPresence] if chat is still open.
  Future<void> resumeActiveChatPresence();

  /// Loads a page of messages for [interlocutorId], newest first.
  ///
  /// Pass [lastMessageId] of the oldest already-loaded message to fetch the next
  /// older page. Results are chronological (oldest → newest within the page).
  Future<Paginated<Message>> getChatMessages({
    required String interlocutorId,
    String? lastMessageId,
  });

  Future<void> sendMessage({
    required String interlocutorId,
    required String content,
    required MessageContentType type,
  });

  /// Sends a single image from a local [filePath] (camera or gallery).
  Future<void> sendImageMessage({required String interlocutorId, required String filePath});

  /// Deletes all messages in the chat with [interlocutorId].
  Future<void> clearChat({required String interlocutorId});
}
