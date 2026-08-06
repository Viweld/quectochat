import 'package:flutter/material.dart';
import 'package:shared_core/core.dart';

import 'package:shared_ui/src/theme/app_fonts.dart';
import 'package:shared_ui/src/theme/colors/app_colors_theme.dart';

/// Сокращённый доступ к стилям текста, цветам и локализации.
///
/// Текстовые геттеры возвращают примитивы [AppFonts] без цвета —
/// цвет задаётся в виджете через `copyWith`.
extension ContextExtension on BuildContext {
  TextStyle get mainTitle => AppFonts.mainTitle;

  TextStyle get initials => AppFonts.initials;

  TextStyle get username => AppFonts.username;

  TextStyle get message => AppFonts.message;

  TextStyle get hint => AppFonts.hint;

  TextStyle get dividerLabel => AppFonts.dividerLabel;

  TextStyle get caption => AppFonts.caption;

  /// Semantic role colors from [ThemeData.extensions].
  AppColorsTheme get colors => Theme.of(this).extension<AppColorsTheme>()!;

  AppLocalizations get texts => AppLocalizations.of(this)!;
}
