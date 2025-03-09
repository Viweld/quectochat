import 'dart:async';

import '../../domain/interfaces/i_api_facade.dart';
import '../../domain/interfaces/i_home_repository.dart';
import '../../domain/models/interlocutor.dart';
import '../../domain/models/paginated.dart';

class HomeRepository implements IHomeRepository {
  HomeRepository({required INetworkFacade networkFacade})
      : _networkFacade = networkFacade {
    _interlocutorsStreamController =
        StreamController<Set<Interlocutor>>.broadcast();
  }

  final INetworkFacade _networkFacade;
  late final StreamController<Set<Interlocutor>> _interlocutorsStreamController;

  // ---------------------------------------------------------------------------
  @override
  Future<void> close() async {
    await _interlocutorsStreamController.close();
  }

  // ---------------------------------------------------------------------------
  @override
  InterlocutorsSubscription subscribe(Function(Set<Interlocutor>) listener) {
    return _interlocutorsStreamController.stream.listen(listener);
  }

  // ---------------------------------------------------------------------------
  @override
  Future<void> initialize() async {
    _networkFacade.getActualInterlocutors().listen(_interlocutorsListener);
  }

  void _interlocutorsListener(interlocutors) {
    if (_interlocutorsStreamController.isClosed) return;
    _interlocutorsStreamController.add(interlocutors);
  }

  // ---------------------------------------------------------------------------
  @override
  Future<Paginated<Interlocutor>> getInterlocutors({
    String? lastInterlocutorId,
  }) async {
    return _networkFacade.getInterlocutors(
      lastInterlocutorId: lastInterlocutorId,
    );
  }

  // ---------------------------------------------------------------------------
  @override
  Future<Iterable<Interlocutor>> searchInterlocutors({
    required String searchText,
  }) async {
    return _networkFacade.searchInterlocutors(
      searchText: searchText,
    );
  }

  // ---------------------------------------------------------------------------
  @override
  Future<void> clearChat({required String interlocutorId}) async {
    await _networkFacade.clearChat(interlocutorId: interlocutorId);
  }
}
