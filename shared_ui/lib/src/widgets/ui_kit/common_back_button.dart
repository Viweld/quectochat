import 'package:flutter/material.dart';
import '../../extensions/context_extensions.dart';
import '../../values/qicons.dart';

/// Кнопка "назад"
class CommonBackButton extends StatelessWidget {
  const CommonBackButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(6),
      onPressed: onPressed,
      icon: Icon(Qicons.back, color: context.palette.black, size: 24),
    );
  }
}
