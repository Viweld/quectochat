import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

class ChatScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatScreenAppBar({
    required this.firstName,
    required this.lastName,
    required this.status,
    required this.onBackPressed,
    super.key,
  });

  final String firstName;
  final String lastName;
  final String status;
  final VoidCallback onBackPressed;

  static const double _horizontalInterval = 12;

  @override
  Size get preferredSize => const Size.fromHeight(Values.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.palette.white,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 20, 12),
              child: Row(
                children: <Widget>[
                  /// Кнопка "Назад"
                  SizedBox.square(dimension: 48, child: CommonBackButton(onPressed: onBackPressed)),

                  /// Аватар собеседника
                  CommonUserAvatar(firstName: firstName, lastName: lastName),
                  const SizedBox(width: _horizontalInterval),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        /// Полное имя собеседника
                        Text(
                          '$firstName $lastName',
                          style: context.username,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),

                        /// Статус нахождения в сети
                        Text(
                          status,
                          style: context.caption,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 1, thickness: 1, color: context.palette.stroke),
          ],
        ),
      ),
    );
  }
}
