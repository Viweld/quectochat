import 'package:flutter/material.dart';
import 'package:shared_core/core.dart';

import '../theme/dynamic_theme.dart';
import '../values/palette.dart';

/// Сокращённый доступ к стилям текста, цветам и локализации.
extension ContextExtension on BuildContext {
  TextStyle? get mainTitle => DynamicTheme.themeOf(this)?.textTheme.headlineLarge;

  TextStyle? get initials => DynamicTheme.themeOf(this)?.textTheme.headlineMedium;

  TextStyle? get username => DynamicTheme.themeOf(this)?.textTheme.titleMedium;

  TextStyle? get message => DynamicTheme.themeOf(this)?.textTheme.bodyMedium;

  TextStyle? get hint => DynamicTheme.themeOf(this)?.textTheme.labelLarge;

  TextStyle? get dividerLabel => DynamicTheme.themeOf(this)?.textTheme.labelMedium;

  TextStyle? get caption => DynamicTheme.themeOf(this)?.textTheme.labelSmall;

  Palette get palette => DynamicTheme.paletteOf(this);

  AppLocalizations get texts => AppLocalizations.of(this)!;
}
