import 'dart:async';

import 'package:home/domain/entities/current_user.dart';
import 'package:shared_domain/shared_domain.dart';

/// Subscription to interlocutors stream.
typedef InterlocutorsSubscription = StreamSubscription<Set<Interlocutor>>;

/// Home / interlocutors repository.
abstract interface class HomeRepository {
  Future<void> close();

  InterlocutorsSubscription subscribe(void Function(Set<Interlocutor>) listener);

  Future<void> initialize();

  Future<Paginated<Interlocutor>> getInterlocutors({String? lastInterlocutorId});

  /// Профиль авторизованного пользователя, `null` — если сессии нет.
  Future<CurrentUser?> getCurrentUser();

  Future<Iterable<Interlocutor>> searchInterlocutors({required String searchText});

  Future<List<Interlocutor>> getNestedContacts({required String anchorUserId});
}
