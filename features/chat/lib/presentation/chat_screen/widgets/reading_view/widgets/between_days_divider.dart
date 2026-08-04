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
          Expanded(child: Divider(indent: 6, endIndent: 10, color: context.colors.text.tertiary)),
          Text(
            isToday(message.createdAt)
                ? context.texts.chatTodayDividerLabel
                : DateFormat('dd.MM.yy').format(message.createdAt.toLocal()),
            style: context.dividerLabel,
          ),
          Expanded(child: Divider(indent: 10, endIndent: 6, color: context.colors.text.tertiary)),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  /// Returns true when [dateTime] is today in the local timezone.
  bool isToday(DateTime dateTime) {
    final DateTime local = dateTime.toLocal();
    final DateTime now = DateTime.now();
    return local.year == now.year && local.month == now.month && local.day == now.day;
  }
}
