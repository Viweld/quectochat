import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

/// Сведения о текущем пользователе в верхней части дравера.
class HomeDrawerUserHeader extends StatelessWidget {
  final String displayName;

  const HomeDrawerUserHeader({super.key, required this.displayName});

  static const double avatarDimension = 72;

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
              ? CommonUserAvatar(displayName: trimmedName, dimension: avatarDimension)
              : const _AvatarPlaceholder(),
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
