import 'package:home/data/dto/interlocutor_dto.dart';
import 'package:shared_domain/shared_domain.dart';

/// Remote home / interlocutors data access.
abstract interface class HomeRemoteDataSource {
  Future<Paginated<InterlocutorDto>> getInterlocutors({String? lastInterlocutorId});

  Future<Iterable<InterlocutorDto>> searchInterlocutors({required String searchText});

  Stream<Set<InterlocutorDto>> getActualInterlocutors();

  Future<void> clearChat({required String interlocutorId});
}
