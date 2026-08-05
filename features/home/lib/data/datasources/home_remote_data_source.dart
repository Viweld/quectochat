import 'package:home/data/dto/interlocutor_dto.dart';
import 'package:home/data/dto/user_dto.dart';
import 'package:shared_domain/shared_domain.dart';

/// Remote home / interlocutors data access.
abstract interface class HomeRemoteDataSource {
  Future<Paginated<InterlocutorDto>> getInterlocutors({String? lastInterlocutorId});

  /// Profile row of the signed-in user, or `null` when there is no session.
  Future<UserDto?> getCurrentUser();

  Future<Iterable<InterlocutorDto>> searchInterlocutors({required String searchText});

  Stream<Set<InterlocutorDto>> getActualInterlocutors();

  Future<void> clearChat({required String interlocutorId});
}
