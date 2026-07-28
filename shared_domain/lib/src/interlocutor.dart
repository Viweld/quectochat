import 'package:flutter/foundation.dart';

import 'message_content_type.dart';

@immutable
final class Interlocutor {
  const Interlocutor({
    required this.userId,
    required this.firstName,
    required this.lastName,
    this.lastSentContent,
    this.lastSentContentType,
    this.lastSentAt,
    this.isSentByYou,
  });

  /// Идентификатор пользователя-собеседника.
  final String userId;

  /// Имя пользователя-собеседника.
  final String firstName;

  /// Фамилия пользователя-собеседника.
  final String lastName;

  /// Контент последнего сообщения
  /// (может быть null если переписка не начата).
  final String? lastSentContent;

  /// Тип контента последнего сообщения
  /// (может быть null если переписка не начата).
  final MessageContentType? lastSentContentType;

  /// Время отправки последнего сообщения
  /// (может быть null если переписка не начата).
  final DateTime? lastSentAt;

  /// Флаг, указывающий, отправлено ли последнее сообщение вами
  /// (может быть null если переписка не начата).
  final bool? isSentByYou;

  // ---------------------------------------------------------------------------
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is Interlocutor && other.userId == userId;
  }

  @override
  int get hashCode => userId.hashCode;
}
