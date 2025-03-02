import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';

import '../../../../../../domain/models/chat_message.dart';

/// Разделитель между днями
class BetweenDaysDivider extends StatelessWidget {
  const BetweenDaysDivider({
    required this.message,
    super.key,
  });

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              indent: 6,
              endIndent: 10,
              color: context.palette.gray,
            ),
          ),
          Text(
            isToday(message.createdAt)
                ? context.texts.chatTodayDividerLabel
                : DateFormat('dd.MM.yy').format(message.createdAt),
            style: context.style14w500$dividerLabel,
          ),
          Expanded(
            child: Divider(
              indent: 10,
              endIndent: 6,
              color: context.palette.gray,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  /// Возвращает [true] - если дата сообщения совпадает с сегодняшней, иначе возвращает [false]
  bool isToday(DateTime dateTime) {
    final now = DateTime.now();
    return dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day;
  }
}
