import 'package:flutter/material.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';
import 'package:quectochat/presentation/values/qicons.dart';

import '../../../../../values/values.dart';

/// Кнопка прикрепления дополнительных данных
class AttachFileButton extends StatelessWidget {
  const AttachFileButton({
    required this.onTapped,
    super.key,
  });

  final void Function() onTapped;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTapped,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size(42, 42)),
        fixedSize: WidgetStateProperty.all(const Size(42, 42)),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        backgroundColor: WidgetStateProperty.all(context.palette.stroke),
        alignment: Alignment.center,
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
        shape: WidgetStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(Values.textFieldBorderRadius),
            ),
          ),
        ),
      ),
      child: Icon(
        Qicons.attach,
        size: 24,
        color: context.palette.black,
      ),
    );
  }
}
