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
    return ExcludeFocus(
      child: SizedBox(
        width: size,
        height: size,
        child: Material(
          color: context.colors.background.secondary,
          borderRadius: const BorderRadius.all(Radius.circular(Values.textFieldBorderRadius)),
          child: InkWell(
            canRequestFocus: false,
            onTap: onTapped,
            borderRadius: const BorderRadius.all(Radius.circular(Values.textFieldBorderRadius)),
            overlayColor: WidgetStateProperty.all(context.colors.accent.splash),
            child: Center(child: AppIcons.send(color: context.colors.icon.main)),
          ),
        ),
      ),
    );
  }
}
