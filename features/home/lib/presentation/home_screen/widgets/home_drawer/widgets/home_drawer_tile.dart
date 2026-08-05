import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

/// Пункт меню дравера: иконка, заголовок и необязательное описание.
class HomeDrawerTile extends StatelessWidget {
  final AppIcon icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTapped;

  const HomeDrawerTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTapped,
    this.subtitle,
  });

  static const double verticalPadding = 14;
  static const double iconSpacing = 16;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final String? subtitle = this.subtitle;

    return InkWell(
      onTap: onTapped,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Values.horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Row(
          spacing: iconSpacing,
          children: <Widget>[
            icon(color: colors.icon.main),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: context.username?.copyWith(color: colors.text.main)),
                  if (subtitle != null)
                    Text(subtitle, style: context.caption?.copyWith(color: colors.text.secondary)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
