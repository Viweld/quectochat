import 'package:flutter/foundation.dart';

/// Transport model for a profile row.
@immutable
final class UserDto {
  const UserDto({required this.userId, required this.firstName, required this.lastName});

  final String userId;
  final String firstName;
  final String lastName;

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      userId: json['id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
    );
  }
}
