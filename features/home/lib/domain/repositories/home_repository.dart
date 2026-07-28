import 'dart:async';

import 'package:shared_domain/shared_domain.dart';

/// Subscription to interlocutors stream.
typedef InterlocutorsSubscription = StreamSubscription<Set<Interlocutor>>;

/// Home / interlocutors repository.
abstract interface class HomeRepository {
  Future<void> close();

  InterlocutorsSubscription subscribe(void Function(Set<Interlocutor>) listener);

  Future<void> initialize();

  Future<Paginated<Interlocutor>> getInterlocutors({String? lastInterlocutorId});

  Future<Iterable<Interlocutor>> searchInterlocutors({required String searchText});

  Future<void> clearChat({required String interlocutorId});
}
