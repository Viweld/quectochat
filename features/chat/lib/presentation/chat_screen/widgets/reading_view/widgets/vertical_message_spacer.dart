import 'package:chat/domain/entities/message.dart';
import 'package:flutter/material.dart';

/// Разделитель между сообщениями внутри дня
class VerticalMessageSpacer extends StatelessWidget {
  const VerticalMessageSpacer({required this.messages, required this.builderIndex, super.key});

  final Iterable<Message> messages;
  final int builderIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: _getInterval(messages, builderIndex));
  }

  // ---------------------------------------------------------------------------
  /// Возвращает интервал: 6 - между сообщениями в кластере, 20 - между кластерами
  double _getInterval(Iterable<Message> messages, int builderIndex) {
    final List<Message> messageList = messages.toList();
    final int i = messages.length - 1 - builderIndex;
    if (i <= 0 || i >= messageList.length) return 20.0;

    final Message current = messageList[i];
    final Message prev = messageList[i - 1];

    final bool hasPrevSameAuthor = prev.fromId == current.fromId && _isSameDay(prev, current);

    return hasPrevSameAuthor ? 6.0 : 20.0;
  }

  // ---------------------------------------------------------------------------
  /// Returns true when both messages share the same calendar day.
  bool _isSameDay(Message a, Message b) {
    return a.createdAt.year == b.createdAt.year &&
        a.createdAt.month == b.createdAt.month &&
        a.createdAt.day == b.createdAt.day;
  }
}
