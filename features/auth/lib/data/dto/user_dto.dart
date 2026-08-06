import 'package:flutter/foundation.dart';

/// Transport model for a profile row write during registration.
@immutable
final class UserDto {
  const UserDto({required this.displayName});

  final String displayName;

  Map<String, Object?> toJson({required String userId}) {
    return <String, Object?>{'id': userId, 'display_name': displayName};
  }
}
