import '../models/message_content_type.dart';
import '../models/interlocutor.dart';
import '../models/message.dart';
import '../models/paginated.dart';

abstract interface class INetworkFacade {
  // АВТРИЗАЦИЯ:
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  /// Проверка залогиненности пользователя
  Future<bool> checkAuth();

  /// Возвращает стрим с актуальными статусами халогиненности
  Stream<bool> authStateChanges();

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
  /// Получение списка собеседников с их последними сообщениями
  Future<Paginated<Interlocutor>> getInterlocutors({
    String? lastInterlocutorId,
  });

  /// Поиск собеседников
  Future<Iterable<Interlocutor>> searchInterlocutors({
    required String searchText,
  });

  /// Получение актуального списка собеседников в потоке
  Stream<Set<Interlocutor>> getActualInterlocutors();

  /// Очищает переписку с собеседником
  Future<void> clearChat({required String interlocutorId});

  // СООБЩЕНИЯ:
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  /// Получение сообщений в пагинированном виде
  Future<Paginated<Message>> getChatMessages({
    required String interlocutorId,
    String? lastMessageId,
  });

  /// Отправка сообщения
  Future<Message> sendMessage({
    required String interlocutorId,
    required String content,
    required MessageContentType type,
  });

  /// Получить стрим наборами новых или измененных сообщений
  Stream<Set<Message>> getAddedModifiedMessagesStream({
    required String interlocutorId,
  });

  /// Помечает сообщения пользователя как прочитанные
  Future<void> markAsViewed({required String interlocutorId});
}
