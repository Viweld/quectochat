import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

/// Плейсхолдер с надписью "Вы еще не начали переписку..."
class EmptyMessagesPlaceholder extends StatelessWidget {
  const EmptyMessagesPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Values.horizontalPadding),
        child: Text(
          context.texts.chatEmptyMessagesPlaceholder,
          textAlign: TextAlign.center,
          style: context.caption,
        ),
      ),
    );
  }
}
