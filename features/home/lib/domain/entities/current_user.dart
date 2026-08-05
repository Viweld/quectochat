import 'package:flutter/foundation.dart';

/// Профиль авторизованного пользователя.
@immutable
final class CurrentUser {
  const CurrentUser({required this.userId, required this.firstName, required this.lastName});

  final String userId;
  final String firstName;
  final String lastName;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CurrentUser &&
        other.userId == userId &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }

  @override
  int get hashCode => Object.hash(userId, firstName, lastName);
}
