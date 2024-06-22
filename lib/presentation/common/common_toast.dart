import 'package:flutter/material.dart';

import '../../domain/extensions/context_extensions.dart';
import '../values/values.dart';

class CommonToast extends StatelessWidget {
  const CommonToast._({required this.text});

  final String text;

  // ---------------------------------------------------------------------------
  static void showError(
    BuildContext context, {
    required String text,
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CommonToast._(text: text),
          elevation: 10,
          backgroundColor: context.palette.red,
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
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 14,
              top: 14,
              bottom: 14,
            ),
            child: Text(
              text,
              style: context.style14w500$message?.copyWith(
                color: context.palette.blackDark,
              ),
            ),
          ),
        ),
        const SizedBox(width: 14),
        IconButton(
          icon: Icon(
            Icons.close,
            color: context.palette.grayDark,
            //size: 18,
          ),
          //iconSize: 18,
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}
