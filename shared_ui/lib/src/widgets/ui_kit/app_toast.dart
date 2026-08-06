import 'package:flutter/material.dart';

import 'package:shared_ui/src/extensions/context_extensions.dart';
import 'package:shared_ui/src/theme/app_icons.dart';
import 'package:shared_ui/src/values/values.dart';

class AppToast extends StatelessWidget {
  const AppToast._({required this.text});

  final String text;

  // ---------------------------------------------------------------------------
  static void showError(BuildContext context, {required String text}) =>
      _show(context, text: text, backgroundColor: context.colors.feedback.error);

  static void showInfo(BuildContext context, {required String text}) =>
      _show(context, text: text, backgroundColor: context.colors.background.secondary);

  static void _show(BuildContext context, {required String text, required Color backgroundColor}) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: AppToast._(text: text),
          elevation: 10,
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.only(bottom: 20),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Values.toastBorderRadius),
          ),
        ),
      );

  // ---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 14, top: 14, bottom: 14),
            child: Text(text, style: context.message.copyWith(color: context.colors.text.strong)),
          ),
        ),
        const SizedBox(width: 14),
        IconButton(
          icon: AppIcons.close(color: context.colors.text.secondary, size: 18),
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}
