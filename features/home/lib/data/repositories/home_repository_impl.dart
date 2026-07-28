import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_domain/shared_domain.dart';

import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';
import '../dto/interlocutor_dto.dart';
import '../mappers/interlocutor_mapper.dart';

@LazySingleton(as: HomeRepository)
final class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({
    required HomeRemoteDataSource remoteDataSource,
    required CurrentUserPort currentUserPort,
  }) : _remoteDataSource = remoteDataSource,
       _currentUserPort = currentUserPort {
    _interlocutorsStreamController = StreamController<Set<Interlocutor>>.broadcast();
  }

  final HomeRemoteDataSource _remoteDataSource;
  final CurrentUserPort _currentUserPort;
  late final StreamController<Set<Interlocutor>> _interlocutorsStreamController;

  String get _currentUserId => _currentUserPort.currentUserId;

  @override
  Future<void> close() async {
    await _interlocutorsStreamController.close();
  }

  @override
  InterlocutorsSubscription subscribe(void Function(Set<Interlocutor>) listener) {
    return _interlocutorsStreamController.stream.listen(listener);
  }

  @override
  Future<void> initialize() async {
    _remoteDataSource.getActualInterlocutors().listen(_interlocutorsListener);
  }

  void _interlocutorsListener(Set<InterlocutorDto> interlocutors) {
    if (_interlocutorsStreamController.isClosed) return;
    _interlocutorsStreamController.add(
      mapInterlocutorDtosToDomain(dtos: interlocutors, currentUserId: _currentUserId),
    );
  }

  @override
  Future<Paginated<Interlocutor>> getInterlocutors({String? lastInterlocutorId}) async {
    final paginated = await _remoteDataSource.getInterlocutors(
      lastInterlocutorId: lastInterlocutorId,
    );

    return mapInterlocutorDtosPaginatedToDomain(
      paginated: paginated,
      currentUserId: _currentUserId,
    );
  }

  @override
  Future<Iterable<Interlocutor>> searchInterlocutors({required String searchText}) async {
    final dtos = await _remoteDataSource.searchInterlocutors(searchText: searchText);

    return dtos.map((dto) => mapInterlocutorDtoToDomain(dto: dto, currentUserId: _currentUserId));
  }

  @override
  Future<void> clearChat({required String interlocutorId}) async {
    await _remoteDataSource.clearChat(interlocutorId: interlocutorId);
  }
}
