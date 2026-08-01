import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

/// Floating control that jumps the chat list to the newest messages.
class ScrollToLatestButton extends StatelessWidget {
  const ScrollToLatestButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  static const double _size = 44;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.background.secondary,
      elevation: 3,
      shadowColor: context.colors.text.strong.withValues(alpha: 0.24),
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        splashColor: context.colors.accent.splash,
        child: SizedBox.square(
          dimension: _size,
          child: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: context.colors.icon.main,
            size: Values.defaultIconSize,
          ),
        ),
      ),
    );
  }
}
