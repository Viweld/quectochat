import 'package:flutter/foundation.dart';

import 'package:shared_domain/src/message_content_type.dart';

/// Секция строки домашнего списка.
enum InterlocutorSection { pinned, contacts }

@immutable
final class Interlocutor {
  const Interlocutor({
    required this.userId,
    required this.displayName,
    this.lastSentContent,
    this.lastSentContentType,
    this.lastSentAt,
    this.isSentByYou,
    this.section = InterlocutorSection.contacts,
    this.isPinned = false,
    this.nestedUnreadContactCount = 0,
  });

  /// Идентификатор пользователя-собеседника.
  final String userId;

  /// Отображаемое имя пользователя-собеседника.
  final String displayName;

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

  final InterlocutorSection section;
  final bool isPinned;
  final int nestedUnreadContactCount;

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
