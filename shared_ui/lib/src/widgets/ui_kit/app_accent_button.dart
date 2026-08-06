import 'package:flutter/material.dart';

import 'package:shared_ui/src/extensions/context_extensions.dart';
import 'package:shared_ui/src/values/values.dart';
import 'package:shared_ui/src/widgets/ui_kit/app_icon.dart';

class AppAccentButton extends StatelessWidget {
  /// Надпись на кнопке
  final String title;

  /// Коллбэк при нажатии
  final VoidCallback onTapped;

  /// (Опционально) Иконка на кнопке
  final AppIcon? icon;

  /// Активна ли кнопка (активна если isEnabled = true)
  final bool isEnabled;

  /// Отображается ли индикатор загрузки (отображается если isPending = true)
  final bool isPending;

  /// Надпись на кнопке в верхнем регистре
  final bool isUpperCaseTitle;

  const AppAccentButton({
    required this.title,
    required this.onTapped,
    this.isEnabled = true,
    this.isPending = false,
    this.icon,
    this.isUpperCaseTitle = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Color textColor = context.colors.text.inverse;
    final Color backgroundColor = context.colors.accent.main;
    final Color splashColor = context.colors.splash.main;
    final AppIcon? icon = this.icon;

    return ElevatedButton(
      onPressed: isEnabled ? onTapped : null,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(backgroundColor),
        overlayColor: WidgetStatePropertyAll<Color>(splashColor),
        elevation: const WidgetStatePropertyAll<double>(0),
        minimumSize: const WidgetStatePropertyAll<Size>(Size.fromHeight(Values.buttonHeight)),
        shape: WidgetStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(Values.buttonBorderRadius)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (isPending) ...<Widget>[
            SizedBox.square(dimension: 16, child: CircularProgressIndicator(color: textColor)),
            const SizedBox(width: 16),
          ],
          Text(
            isUpperCaseTitle ? title.toUpperCase() : title,
            style: context.username.copyWith(color: textColor),
          ),
          if (icon != null) ...<Widget>[const SizedBox(width: 4), icon(color: textColor)],
        ],
      ),
    );
  }
}
