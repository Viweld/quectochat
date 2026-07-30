import 'package:flutter/material.dart';

import 'package:shared_ui/src/extensions/context_extensions.dart';

/// Кнопка "назад"
class CommonBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CommonBackButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(6),
      onPressed: onPressed,
      icon: Icon(Icons.chevron_left, color: context.colors.icon.main, size: 24),
    );
  }
}
