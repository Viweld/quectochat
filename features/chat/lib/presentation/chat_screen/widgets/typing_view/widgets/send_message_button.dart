import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

/// Кнопка отправки сообщения
class SendMessageButton extends StatelessWidget {
  const SendMessageButton({required this.onTapped, this.size = Values.buttonHeight, super.key});

  final void Function() onTapped;

  /// Side length of the square button (matches composer field height).
  final double size;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTapped,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(Size(size, size)),
        fixedSize: WidgetStateProperty.all(Size(size, size)),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        backgroundColor: WidgetStateProperty.all(context.colors.background.secondary),
        alignment: Alignment.center,
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
        shape: WidgetStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(Values.textFieldBorderRadius)),
          ),
        ),
      ),
      child: AppIcons.send(color: context.colors.icon.main),
    );
  }
}
