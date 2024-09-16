import 'dart:async';

import 'package:flutter/foundation.dart';

import '../models/chat_message.dart';
import '../models/chat_message_type.dart';

// -----------------------------------------------------------------------------
/// Ошибки в репозитории
@immutable
final class ChatRepositoryError {
  const ChatRepositoryError({this.message});

  final String? message;
}

// ПОДПИСКИ:
// -----------------------------------------------------------------------------
/// Подписка на стрим с сообщениями
typedef ChatMessagesSubscription = StreamSubscription<Iterable<ChatMessage>>;

/// Подписка на стрим с ошибками
typedef ChatErrorsSubscription = StreamSubscription<ChatRepositoryError>;

// РЕПОЗИТОРИЙ:
// -----------------------------------------------------------------------------
/// репозиторий чата
abstract interface class IChatRepository {
  /// закрытие репозитория, закрытие стримов
  Future<void> close();

  /// подписка на изменения данных в репозитории
  ChatMessagesSubscription subscribeEvents(
    Function(Iterable<ChatMessage>) listener,
  );

  /// подписка на ошибки в репозитории
  ChatErrorsSubscription subscribeErrors(
    Function(ChatRepositoryError) listener,
  );

  /// Инициализация данных при открытии чата
  Future<void> initialize({required String toId});

  /// Очистка данных при закрытии чата
  Future<void> cleanup();

  /// Получение следующей страницы с сообщениями
  Future<void> fetchNextMessages();

  /// Отправка сообщения
  Future<void> sendMessage({
    required String content,
    required ChatMessageType type,
  });
}
