import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

/// Placeholder when the home interlocutors list is empty and there is no load error.
class HomeEmptyInterlocutorsView extends StatelessWidget {
  const HomeEmptyInterlocutorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Values.horizontalPadding),
        child: Text(
          context.texts.homeEmptyInterlocutorsMessage,
          textAlign: TextAlign.center,
          style: context.caption.copyWith(color: context.colors.text.secondary),
        ),
      ),
    );
  }
}
