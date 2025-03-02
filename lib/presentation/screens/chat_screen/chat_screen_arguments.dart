import 'package:flutter/foundation.dart';

@immutable
class ChatScreenArguments {
  const ChatScreenArguments({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  /// Идентификатор пользователя.
  final String id;

  /// Имя пользователя.
  final String firstName;

  /// Фамилия пользователя.
  final String lastName;
}
