import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

/// Сведения о текущем пользователе в верхней части дравера.
class HomeDrawerUserHeader extends StatelessWidget {
  final String firstName;
  final String lastName;

  const HomeDrawerUserHeader({super.key, required this.firstName, required this.lastName});

  static const double avatarDimension = 72;

  bool get hasName => firstName.isNotEmpty || lastName.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final String fullName = '$firstName $lastName'.trim();

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
              ? CommonUserAvatar(
                  firstName: firstName,
                  lastName: lastName,
                  dimension: avatarDimension,
                )
              : const _AvatarPlaceholder(),
          Expanded(
            child: Text(
              hasName ? fullName : context.texts.homeDrawerUnnamedUser,
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

final class _AvatarPlaceholder extends StatelessWidget {
  const _AvatarPlaceholder();

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Container(
      width: HomeDrawerUserHeader.avatarDimension,
      height: HomeDrawerUserHeader.avatarDimension,
      decoration: BoxDecoration(color: colors.background.secondary, shape: BoxShape.circle),
      child: Icon(
        Icons.person_outline,
        size: HomeDrawerUserHeader.avatarDimension * 0.5,
        color: colors.icon.secondary,
      ),
    );
  }
}
