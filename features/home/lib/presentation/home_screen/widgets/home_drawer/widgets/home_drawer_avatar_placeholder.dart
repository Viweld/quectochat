import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

/// Circular placeholder when the current user has no display name yet.
class HomeDrawerAvatarPlaceholder extends StatelessWidget {
  const HomeDrawerAvatarPlaceholder({super.key});

  static const double dimension = 72;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Container(
      width: dimension,
      height: dimension,
      decoration: BoxDecoration(color: colors.background.secondary, shape: BoxShape.circle),
      child: Icon(Icons.person_outline, size: dimension * 0.5, color: colors.icon.secondary),
    );
  }
}
