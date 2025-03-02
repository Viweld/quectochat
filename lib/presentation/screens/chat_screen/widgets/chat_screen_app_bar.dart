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

  // ---------------------------------------------------------------------------
  @override
  Size get preferredSize => const Size.fromHeight(Values.appBarHeight);

  // ---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      toolbarHeight: Values.appBarHeight,
      elevation: 0,
      // leadingWidth: 32 + 16 + 4 + 4,
      leading: const CommonBackButton(),
      titleSpacing: 0,
      title: Row(
        children: [
          CommonUserAvatar(
            firstName: firstName,
            lastName: lastName,
          ),
          const SizedBox(width: _horizontalInterval),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Полное имя собеседника
              Text(
                '$firstName $lastName',
                style: context.style15w600$username,
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
        ],
      ),
    );
  }
}
