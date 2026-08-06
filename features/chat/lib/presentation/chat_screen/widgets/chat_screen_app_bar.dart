import 'package:chat/presentation/chat_screen/widgets/chat_screen_more_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

class ChatScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatScreenAppBar({
    required this.displayName,
    required this.status,
    required this.onBackPressed,
    required this.onClearChatPressed,
    this.statusColor,
    super.key,
  });

  final String displayName;
  final String status;
  final Color? statusColor;
  final VoidCallback onBackPressed;
  final VoidCallback onClearChatPressed;

  static const double _horizontalInterval = 12;

  @override
  Size get preferredSize => const Size.fromHeight(Values.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colors.background.main,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 8, 12),
              child: Row(
                children: <Widget>[
                  /// Кнопка "Назад"
                  SizedBox.square(dimension: 48, child: CommonBackButton(onPressed: onBackPressed)),

                  /// Аватар собеседника
                  CommonUserAvatar(displayName: displayName),
                  const SizedBox(width: _horizontalInterval),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        /// Полное имя собеседника
                        Text(
                          displayName,
                          style: context.username,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),

                        /// Статус нахождения в сети
                        if (status.isNotEmpty)
                          Text(
                            status,
                            style: statusColor == null
                                ? context.caption
                                : context.caption?.copyWith(color: statusColor),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                      ],
                    ),
                  ),
                  ChatScreenMoreButton(onClearChatPressed: onClearChatPressed),
                ],
              ),
            ),
            Divider(height: 1, thickness: 1, color: context.colors.border.main),
          ],
        ),
      ),
    );
  }
}
