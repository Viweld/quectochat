import 'package:flutter/foundation.dart';

@immutable
final class ChatListItem {
  const ChatListItem({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.lastMessageText,
    required this.lastMessageSentAt,
    required this.isSentByYou,
  });

  /// Идентификатор пользователя.
  final String id;

  /// Имя пользователя.
  final String firstName;

  /// Фамилия пользователя.
  final String lastName;

  /// Текст последнего сообщения.
  final String lastMessageText;

  /// Время отправки последнего сообщения.
  final DateTime lastMessageSentAt;

  /// Флаг, указывающий, отправлено ли последнее сообщение вами.
  final bool isSentByYou;
}
