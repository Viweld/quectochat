import 'dart:async';

import 'package:home/data/datasources/home_remote_data_source.dart';
import 'package:home/data/dto/interlocutor_dto.dart';
import 'package:home/data/mappers/interlocutor_mapper.dart';
import 'package:home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_domain/shared_domain.dart';

@LazySingleton(as: HomeRepository)
final class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({
    required HomeRemoteDataSource remoteDataSource,
    required CurrentUserPort currentUserPort,
  }) : _remoteDataSource = remoteDataSource,
       _currentUserPort = currentUserPort;

  final HomeRemoteDataSource _remoteDataSource;
  final CurrentUserPort _currentUserPort;
  final StreamController<Set<Interlocutor>> _interlocutorsStreamController =
      StreamController<Set<Interlocutor>>.broadcast();

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
    final Paginated<InterlocutorDto> paginated = await _remoteDataSource.getInterlocutors(
      lastInterlocutorId: lastInterlocutorId,
    );

    return mapInterlocutorDtosPaginatedToDomain(
      paginated: paginated,
      currentUserId: _currentUserId,
    );
  }

  @override
  Future<Iterable<Interlocutor>> searchInterlocutors({required String searchText}) async {
    final Iterable<InterlocutorDto> dtos = await _remoteDataSource.searchInterlocutors(
      searchText: searchText,
    );

    return dtos.map(
      (InterlocutorDto dto) => mapInterlocutorDtoToDomain(dto: dto, currentUserId: _currentUserId),
    );
  }

  @override
  Future<void> clearChat({required String interlocutorId}) async {
    await _remoteDataSource.clearChat(interlocutorId: interlocutorId);
  }
}
