import 'package:flutter/material.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';

import '../values/qicons.dart';

/// Кнопка "назад"
class CommonBackButton extends StatelessWidget {
  const CommonBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(16),
      onPressed: () => Navigator.pop(context),
      icon: Icon(
        Qicons.back,
        color: context.palette.grayDark,
        size: 32,
      ),
    );
  }
}
