import 'package:flutter/material.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

/// Confirm dialog before deleting the entire chat history.
class ChatClearChatConfirmDialog extends StatelessWidget {
  const ChatClearChatConfirmDialog({super.key});

  static Future<bool> show(BuildContext context) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) => const ChatClearChatConfirmDialog(),
    );
    return confirmed ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations texts = context.texts;

    return AlertDialog(
      title: Text(texts.chatClearChatConfirmTitle),
      content: Text(texts.chatClearChatConfirmMessage),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(texts.commonCancel),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(texts.chatClearChatLabel),
        ),
      ],
    );
  }
}
