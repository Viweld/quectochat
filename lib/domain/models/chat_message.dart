import 'package:flutter/foundation.dart';
import 'package:quectochat/domain/models/chat_message_type.dart';

@immutable
final class ChatMessage {
  const ChatMessage({
    required this.fromId,
    required this.toId,
    required this.createdAt,
    required this.content,
    required this.type,
  });

  final String fromId;
  final String toId;
  final DateTime createdAt;
  final String content;
  final ChatMessageType type;
}
