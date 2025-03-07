import '../models/message_content_type.dart';
import '../models/interlocutor.dart';
import '../models/message.dart';
import '../models/paginated.dart';
import '../models/user_details.dart';

abstract interface class INetworkFacade {
  /// Возвращает ID текущего пользователя
  String get currentUserId;

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
  /// Получение списка собеседников с их последними сообщениями
  Future<Paginated<Interlocutor>> getInterlocutors({
    String? lastInterlocutorId,
    String? search,
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
