import 'package:flutter/material.dart';
import 'package:shared_core/core.dart';

import 'package:shared_ui/src/theme/colors/app_colors_theme.dart';
import 'package:shared_ui/src/theme/dynamic_theme.dart';

/// Сокращённый доступ к стилям текста, цветам и локализации.
extension ContextExtension on BuildContext {
  TextStyle? get mainTitle => DynamicTheme.themeOf(this)?.textTheme.headlineLarge;

  TextStyle? get initials => DynamicTheme.themeOf(this)?.textTheme.headlineMedium;

  TextStyle? get username => DynamicTheme.themeOf(this)?.textTheme.titleMedium;

  TextStyle? get message => DynamicTheme.themeOf(this)?.textTheme.bodyMedium;

  TextStyle? get hint => DynamicTheme.themeOf(this)?.textTheme.labelLarge;

  TextStyle? get dividerLabel => DynamicTheme.themeOf(this)?.textTheme.labelMedium;

  TextStyle? get caption => DynamicTheme.themeOf(this)?.textTheme.labelSmall;

  /// Semantic role colors from [ThemeData.extensions].
  AppColorsTheme get colors => Theme.of(this).extension<AppColorsTheme>()!;

  AppLocalizations get texts => AppLocalizations.of(this)!;
}
