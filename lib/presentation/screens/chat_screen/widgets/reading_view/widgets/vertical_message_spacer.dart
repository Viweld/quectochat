import 'package:flutter/material.dart';

import '../../../../../../domain/models/message.dart';

/// Разделитель между сообщениями внутри дня
class VerticalMessageSpacer extends StatelessWidget {
  const VerticalMessageSpacer({
    required this.messages,
    required this.builderIndex,
    super.key,
  });

  final Iterable<Message> messages;
  final int builderIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _getInterval(messages, builderIndex),
    );
  }

  // ---------------------------------------------------------------------------
  /// Возвращает интервал: 6 - между сообщениями в кластере, 20 - между кластерами
  double _getInterval(Iterable<Message> messages, int builderIndex) {
    final messageList = messages.toList();
    final i = messages.length - 1 - builderIndex;
    if (i <= 0 || i >= messageList.length) return 20.0;

    final current = messageList[i];
    final prev = messageList[i - 1];

    final bool hasPrevSameAuthor =
        prev.fromId == current.fromId && _isSameDay(prev, current);

    return hasPrevSameAuthor ? 6.0 : 20.0;
  }

  // ---------------------------------------------------------------------------
  /// Возвращает [true] - если даты сообщений одинаковы
  /// и [false] - если даты сообщений различаются
  bool _isSameDay(Message a, Message b) {
    return a.createdAt.year == b.createdAt.year &&
        a.createdAt.month == b.createdAt.month &&
        a.createdAt.day == b.createdAt.day;
  }
}
