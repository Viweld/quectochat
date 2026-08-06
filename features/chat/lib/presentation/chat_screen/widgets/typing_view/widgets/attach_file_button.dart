import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

/// Кнопка прикрепления дополнительных данных
class AttachFileButton extends StatelessWidget {
  const AttachFileButton({required this.onTapped, this.size = Values.buttonHeight, super.key});

  final void Function() onTapped;

  /// Side length of the square button (matches composer field height).
  final double size;

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(Values.textFieldBorderRadius);

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
        side: WidgetStateProperty.all(
          BorderSide(color: context.colors.border.main, width: AppEditField.borderThickness),
        ),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: borderRadius)),
      ),
      child: AppIcons.paperclip(color: context.colors.icon.main),
    );
  }
}
