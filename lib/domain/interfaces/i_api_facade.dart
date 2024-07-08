import 'package:quectochat/domain/models/chat_message_type.dart';

import '../models/chat_message.dart';
import '../models/user_details.dart';

abstract interface class INetworkFacade {
  // АВТРИЗАЦИЯ:
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  /// Проверка залогиненности пользователя
  bool checkAuth();

  /// Логин пользователя
  Future<void> logIn({
    required String email,
    required String password,
  });

  /// Регистрация пользователя
  Future<void> registration({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });

  /// Разлогин пользователя
  Future<void> logOut();

  // СОБЕСЕДНИКИ:
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  /// Получение пользователей для переписки
  Future<Iterable<UserDetails>> getUsers({
    String textSearch,
  });

  // СООБЩЕНИЯ:
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  /// Получение сообщений в пагинированном виде
  /// (для получения последующих страниц isNext должен быть true)
  Future<Iterable<ChatMessage>> getChatMessages({
    required String toId,
    bool isNext,
  });

  /// Отправка сообщения
  Future<void> sendMessage({
    required String toId,
    required String content,
    required ChatMessageType type,
  });

  /// Получить стрим сообщений
  Stream<ChatMessage> getNewMessagesStream({required String toId});
// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
}
