import 'package:chat/domain/entities/message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_ui/core_ui.dart';

/// Разделитель между днями
class BetweenDaysDivider extends StatelessWidget {
  const BetweenDaysDivider({required this.message, super.key});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          Expanded(child: Divider(indent: 6, endIndent: 10, color: context.palette.gray)),
          Text(
            isToday(message.createdAt)
                ? context.texts.chatTodayDividerLabel
                : DateFormat('dd.MM.yy').format(message.createdAt),
            style: context.dividerLabel,
          ),
          Expanded(child: Divider(indent: 10, endIndent: 6, color: context.palette.gray)),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  /// Returns true when [dateTime] is today, otherwise false.
  bool isToday(DateTime dateTime) {
    final DateTime now = DateTime.now();
    return dateTime.year == now.year && dateTime.month == now.month && dateTime.day == now.day;
  }
}
