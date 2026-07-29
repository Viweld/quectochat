import 'package:chat/domain/entities/message_status.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_domain/shared_domain.dart';

@immutable
final class Message {
  const Message({
    required this.id,
    required this.chatId,
    required this.fromId,
    required this.toId,
    required this.createdAt,
    required this.content,
    required this.type,
    required this.deliveredAt,
    required this.readAt,
    required this.isOwn,
  });

  // ---------------------------------------------------------------------------
  final String id;
  final String chatId;
  final String fromId;
  final String toId;
  final DateTime createdAt;
  final String content;
  final MessageContentType type;
  final DateTime? deliveredAt;
  final DateTime? readAt;
  final bool isOwn;

  // ---------------------------------------------------------------------------
  MessageStatus get status {
    if (readAt != null) return MessageStatus.read;
    if (deliveredAt != null) return MessageStatus.delivered;
    return MessageStatus.sent;
  }

  // ---------------------------------------------------------------------------
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is Message &&
        other.id == id &&
        other.deliveredAt == deliveredAt &&
        other.readAt == readAt;
  }

  @override
  int get hashCode => Object.hash(id, chatId, deliveredAt, readAt);
}
