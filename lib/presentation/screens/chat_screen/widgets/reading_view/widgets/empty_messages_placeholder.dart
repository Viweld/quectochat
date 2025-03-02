import 'package:flutter/material.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';

import '../../../../../values/values.dart';

/// Плейсхолдер с надписью "Вы еще не начали переписку..."
class EmptyMessagesPlaceholder extends StatelessWidget {
  const EmptyMessagesPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Values.horizontalPadding,
        ),
        child: Text(
          context.texts.chatEmptyMessagesPlaceholder,
          textAlign: TextAlign.center,
          style: context.style12w500$labels,
        ),
      ),
    );
  }
}
