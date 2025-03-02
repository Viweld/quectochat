import 'package:flutter/material.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';

import '../../../common/common_back_button.dart';
import '../../../common/common_user_avatar.dart';
import '../../../values/values.dart';

class ChatScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatScreenAppBar({
    required this.firstName,
    required this.lastName,
    required this.status,
    super.key,
  });

  final String firstName;
  final String lastName;
  final String status;

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
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 20, 12),
              child: Row(
                children: [
                  /// Кнопка "Назад"
                  const SizedBox.square(
                    dimension: 48,
                    child: CommonBackButton(),
                  ),

                  /// Аватар собеседника
                  CommonUserAvatar(
                    firstName: firstName,
                    lastName: lastName,
                  ),
                  const SizedBox(width: _horizontalInterval),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Полное имя собеседника
                        Text(
                          '$firstName $lastName',
                          style: context.style15w600$username,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),

                        /// Статус нахождения в сети
                        Text(
                          status,
                          style: context.style12w500$labels,
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
