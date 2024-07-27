import 'package:flutter/material.dart';

import '../../domain/extensions/context_extensions.dart';

import '../values/values.dart';

class CommonAccentButton extends StatelessWidget {
  const CommonAccentButton({
    required this.title,
    required this.onTapped,
    this.isEnabled = true,
    this.isPending = false,
    this.iconData,
    this.isUpperCaseTitle = false,
    super.key,
  });

  /// Надпись на кнопке
  final String title;

  /// Коллбэк при нажатии
  final VoidCallback onTapped;

  /// (Опционально) Иконка на кнопке
  final IconData? iconData;

  /// Активна ли кнопка (активна если isEnabled = true)
  final bool isEnabled;

  /// Отображается ли индикатор загрузки (отображается если isPending = true)
  final bool isPending;

  /// Надпись на кнопке в верхнем регистре
  final bool isUpperCaseTitle;

  @override
  Widget build(BuildContext context) {
    final textColor = context.palette.white;
    final backgroundColor = context.palette.green;
    final splashColor = context.palette.green;

    return ElevatedButton(
      onPressed: isEnabled ? onTapped : null,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
        overlayColor: WidgetStatePropertyAll(splashColor),
        elevation: const WidgetStatePropertyAll(0),
        minimumSize: const WidgetStatePropertyAll(
          Size.fromHeight(Values.buttonHeight),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Values.buttonBorderRadius),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isPending) ...[
            SizedBox.square(
              dimension: 16,
              child: CircularProgressIndicator(color: textColor),
            ),
            const SizedBox(width: 16),
          ],
          Text(
            isUpperCaseTitle ? title.toUpperCase() : title,
            style: context.style15w600$username?.copyWith(color: textColor),
          ),
          if (iconData != null) ...[
            const SizedBox(width: 4),
            Icon(
              iconData,
              color: textColor,
              size: 24,
            )
          ]
        ],
      ),
    );
  }
}
