import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

class ChatScreenMoreButton extends StatelessWidget {
  const ChatScreenMoreButton({required this.onClearChatPressed, super.key});

  final VoidCallback onClearChatPressed;

  static const double _menuIconSpacing = 12;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return PopupMenuButton<_ChatMoreAction>(
      icon: AppIcons.more(color: colors.icon.main),
      onSelected: (_ChatMoreAction action) {
        if (action == _ChatMoreAction.clearChat) {
          onClearChatPressed();
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<_ChatMoreAction>>[
        PopupMenuItem<_ChatMoreAction>(
          value: _ChatMoreAction.clearChat,
          child: Row(
            children: <Widget>[
              AppIcons.clean(color: colors.icon.main),
              const SizedBox(width: _menuIconSpacing),
              Text(context.texts.chatClearChatLabel),
            ],
          ),
        ),
      ],
    );
  }
}

enum _ChatMoreAction { clearChat }
