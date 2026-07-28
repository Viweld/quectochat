import 'package:flutter/foundation.dart';

/// Transport model for the last message preview in interlocutor list.
@immutable
final class MessagePreviewDto {
  const MessagePreviewDto({
    required this.content,
    required this.type,
    required this.createdAt,
    required this.fromId,
  });

  final String content;

  /// Transport value: `text` or `image`.
  final String type;
  final DateTime createdAt;
  final String fromId;

  factory MessagePreviewDto.fromJson(Map<String, dynamic> json) {
    return MessagePreviewDto(
      content: json['content'] as String? ?? json['last_content'] as String,
      type: json['type'] as String? ?? json['last_type'] as String,
      createdAt: DateTime.parse(
        (json['created_at'] as String?) ?? (json['last_created_at'] as String),
      ),
      fromId: json['from_id'] as String? ?? json['last_from_id'] as String,
    );
  }
}
