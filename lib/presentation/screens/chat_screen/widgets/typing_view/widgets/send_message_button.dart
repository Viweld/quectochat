import 'package:flutter/material.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';

import '../../../../../values/values.dart';

/// Кнопка отправки сообщения
class SendMessageButton extends StatelessWidget {
  const SendMessageButton({
    required this.onTapped,
    super.key,
  });

  final void Function() onTapped;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTapped,
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all(const Size(42, 42)),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        backgroundColor: WidgetStateProperty.all(context.palette.stroke),
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
        Icons.send,
        color: context.palette.black,
      ),
    );
  }
}
