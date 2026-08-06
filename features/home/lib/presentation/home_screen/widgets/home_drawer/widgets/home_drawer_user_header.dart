import 'package:flutter/material.dart';
import 'package:home/presentation/home_screen/widgets/home_drawer/widgets/home_drawer_avatar_placeholder.dart';
import 'package:shared_ui/core_ui.dart';

/// Current-user block at the top of the home drawer.
class HomeDrawerUserHeader extends StatelessWidget {
  const HomeDrawerUserHeader({super.key, required this.displayName});

  final String displayName;

  bool get hasName => displayName.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final String trimmedName = displayName.trim();

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Values.horizontalPadding,
        24,
        Values.horizontalPadding,
        24,
      ),
      child: Row(
        spacing: 16,
        children: <Widget>[
          hasName
              ? AppUserAvatar(
                  displayName: trimmedName,
                  dimension: HomeDrawerAvatarPlaceholder.dimension,
                )
              : const HomeDrawerAvatarPlaceholder(),
          Expanded(
            child: Text(
              hasName ? trimmedName : context.texts.homeDrawerUnnamedUser,
              style: context.username?.copyWith(color: colors.text.main),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
