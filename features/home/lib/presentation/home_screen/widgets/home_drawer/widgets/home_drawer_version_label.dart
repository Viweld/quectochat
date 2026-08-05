import 'package:flutter/material.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

/// Серая строка с версией сборки под кнопкой выхода.
class HomeDrawerVersionLabel extends StatelessWidget {
  const HomeDrawerVersionLabel({super.key});

  @override
  Widget build(BuildContext context) {
    if (!appLocator.isRegistered<AppInfo>()) return const SizedBox.shrink();

    final AppInfo appInfo = appLocator<AppInfo>();

    return Text(
      context.texts.homeDrawerVersionLabel(appInfo.version, appInfo.buildNumber),
      textAlign: TextAlign.center,
      style: context.caption?.copyWith(color: context.colors.text.tertiary),
    );
  }
}
