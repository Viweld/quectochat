import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

/// Кнопка отправки сообщения.
///
/// Uses a non-focusable [InkWell] so pressing it does not dismiss the IME.
class SendMessageButton extends StatelessWidget {
  const SendMessageButton({required this.onTapped, this.size = Values.buttonHeight, super.key});

  final void Function() onTapped;

  /// Side length of the square button (matches composer field height).
  final double size;

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(Values.textFieldBorderRadius);

    return ExcludeFocus(
      child: SizedBox(
        width: size,
        height: size,
        child: Material(
          color: context.colors.background.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: BorderSide(
              color: context.colors.border.main,
              width: AppEditField.borderThickness,
            ),
          ),
          child: InkWell(
            canRequestFocus: false,
            onTap: onTapped,
            borderRadius: borderRadius,
            overlayColor: WidgetStateProperty.all(context.colors.splash.main),
            child: Center(child: AppIcons.send(color: context.colors.icon.main)),
          ),
        ),
      ),
    );
  }
}
