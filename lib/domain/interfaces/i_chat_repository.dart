import 'dart:async';

import 'package:flutter/foundation.dart';

import '../models/message.dart';
import '../models/message_content_type.dart';
import '../models/paginated.dart';

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
typedef ChatMessagesSubscription = StreamSubscription<Iterable<Message>>;

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
    Function(Iterable<Message>) listener,
  );

  /// подписка на ошибки в репозитории
  ChatErrorsSubscription subscribeErrors(
    Function(ChatRepositoryError) listener,
  );

  /// Инициализация данных при открытии чата
  Future<void> initialize({required String interlocutorId});

  /// Помечает сообщения пользователя как прочитанные
  Future<void> markAsViewed({required String interlocutorId});

  /// Очистка данных при закрытии чата
  Future<void> cleanup();

  /// Получение сообщений в пагинированном виде
  Future<Paginated<Message>> getChatMessages({
    required String interlocutorId,
    String? lastMessageId,
  });

  /// Отправка сообщения
  Future<void> sendMessage({
    required String interlocutorId,
    required String content,
    required MessageContentType type,
  });
}
