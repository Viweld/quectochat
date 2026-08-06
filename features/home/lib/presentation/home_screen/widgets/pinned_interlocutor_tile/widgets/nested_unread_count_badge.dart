import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

/// Green message icon with a capped unread count (`9+`) for nested contacts.
class NestedUnreadCountBadge extends StatelessWidget {
  const NestedUnreadCountBadge({super.key, required this.count});

  final int count;

  static const double _size = 28;
  static const int _cap = 9;

  @override
  Widget build(BuildContext context) {
    final String label = count > _cap ? '9+' : '$count';

    return SizedBox.square(
      dimension: _size,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          AppIcons.messageFilled(color: context.colors.accent.main, size: _size),
          Text(
            label,
            style: context.caption?.copyWith(
              color: context.colors.text.inverse,
              fontSize: count > _cap ? 9 : 11,
              fontWeight: FontWeight.w700,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
