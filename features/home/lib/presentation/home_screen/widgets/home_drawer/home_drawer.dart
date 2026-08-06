import 'package:flutter/material.dart';
import 'package:home/presentation/home_screen/widgets/home_drawer/widgets/home_drawer_tile.dart';
import 'package:home/presentation/home_screen/widgets/home_drawer/widgets/home_drawer_user_header.dart';
import 'package:home/presentation/home_screen/widgets/home_drawer/widgets/home_drawer_version_label.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

/// Боковое меню домашнего экрана: профиль сверху, пункты меню, выход снизу.
class HomeDrawer extends StatelessWidget {
  final String displayName;
  final bool canInvite;
  final bool isLogoutPending;
  final VoidCallback onProfileTapped;
  final VoidCallback onAddUserTapped;
  final VoidCallback onLogoutTapped;

  const HomeDrawer({
    super.key,
    required this.displayName,
    required this.canInvite,
    required this.isLogoutPending,
    required this.onProfileTapped,
    required this.onAddUserTapped,
    required this.onLogoutTapped,
  });

  static const double widthFactor = 0.85;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final AppLocalizations texts = context.texts;

    return Drawer(
      backgroundColor: colors.background.main,
      width: MediaQuery.sizeOf(context).width * widthFactor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            HomeDrawerUserHeader(displayName: displayName),
            Divider(height: Values.dividerThickness, color: colors.border.main),
            HomeDrawerTile(
              icon: AppIcons.user,
              title: texts.homeDrawerProfileTitle,
              subtitle: texts.homeDrawerProfileSubtitle,
              onTapped: () => _closeAndRun(context, onProfileTapped),
            ),
            if (canInvite)
              HomeDrawerTile(
                icon: AppIcons.userAdd,
                title: texts.homeDrawerAddUserTitle,
                subtitle: texts.homeDrawerAddUserSubtitle,
                onTapped: () => _closeAndRun(context, onAddUserTapped),
              ),
            const Spacer(),
            Divider(height: Values.dividerThickness, color: colors.border.main),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                Values.horizontalPadding,
                16,
                Values.horizontalPadding,
                12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 12,
                children: <Widget>[
                  CommonAccentButton(
                    title: texts.homeLogoutLabel,
                    icon: AppIcons.logout,
                    isPending: isLogoutPending,
                    onTapped: onLogoutTapped,
                  ),
                  const HomeDrawerVersionLabel(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _closeAndRun(BuildContext context, VoidCallback action) {
    Scaffold.of(context).closeDrawer();
    action();
  }
}
