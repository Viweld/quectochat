import 'package:flutter/foundation.dart';

/// Transport model for a chat message row.
@immutable
final class MessageDto {
  const MessageDto({
    required this.id,
    required this.chatId,
    required this.fromId,
    required this.toId,
    required this.content,
    required this.type,
    required this.createdAt,
    required this.isViewed,
  });

  final String id;
  final String chatId;
  final String fromId;
  final String toId;
  final String content;

  /// Transport value: `text` or `image`.
  final String type;
  final DateTime createdAt;
  final bool isViewed;

  factory MessageDto.fromJson(Map<String, dynamic> json) {
    return MessageDto(
      id: json['id'] as String,
      chatId: json['chat_id'] as String,
      fromId: json['from_id'] as String,
      toId: json['to_id'] as String,
      content: json['content'] as String,
      type: json['type'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      isViewed: json['is_viewed'] as bool,
    );
  }

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'chat_id': chatId,
      'from_id': fromId,
      'to_id': toId,
      'content': content,
      'type': type,
      'is_viewed': isViewed,
    };
  }
}
