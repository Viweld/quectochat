import 'dart:async';

import '../models/interlocutor.dart';
import '../models/paginated.dart';

// ПОДПИСКИ:
// -----------------------------------------------------------------------------
/// Подписка на стрим со свежими собеседниками
typedef InterlocutorsSubscription = StreamSubscription<Set<Interlocutor>>;

// РЕПОЗИТОРИЙ:
// -----------------------------------------------------------------------------
/// репозиторий чата
abstract interface class IHomeRepository {
  /// закрытие репозитория, закрытие стримов
  Future<void> close();

  /// подписание на стрим со свежими собеседниками
  InterlocutorsSubscription subscribe(
    Function(Set<Interlocutor>) listener,
  );

  /// Инициализация и запуск обновлений списка собеседников (в стриме начнут прилетать сеты обновившихся собеседников)
  Future<void> initialize();

  /// Получение списка собеседников с их последними сообщениями
  Future<Paginated<Interlocutor>> getInterlocutors({
    String? lastInterlocutorId,
  });

  /// Поиск собеседников
  Future<Iterable<Interlocutor>> searchInterlocutors({
    required String searchText,
  });

  /// Очищает переписку с собеседником
  Future<void> clearChat({required String interlocutorId});
}
