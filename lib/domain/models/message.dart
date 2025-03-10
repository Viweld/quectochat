import 'package:flutter/foundation.dart';
import 'package:quectochat/domain/models/message_content_type.dart';

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
    required this.isViewed,
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
  final bool isViewed;
  final bool isOwn;

  // ---------------------------------------------------------------------------
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is Message && other.id == id;
  }

  @override
  int get hashCode => Object.hash(id, chatId);
}
