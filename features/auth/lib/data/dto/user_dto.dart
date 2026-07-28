import 'package:flutter/foundation.dart';

/// Transport model for a profile row write during registration.
@immutable
final class UserDto {
  const UserDto({required this.firstName, required this.lastName});

  final String firstName;
  final String lastName;

  Map<String, Object?> toJson({required String userId}) {
    return {'id': userId, 'first_name': firstName, 'last_name': lastName};
  }
}
