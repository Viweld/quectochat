import 'package:flutter/material.dart';

import '../values/palette.dart';
import 'app_fonts.dart';
import '../theme_type.dart';

class ThemeBuilder {
  // ---------------------------------------------------------------------------
  static Palette getPalette(ThemeType type) {
    return switch (type) {
      ThemeType.regular => Palette.regular(),
    };
  }

  // ---------------------------------------------------------------------------
  static ThemeData getTheme(ThemeType type, Palette palette) {
    return switch (type) {
      ThemeType.regular => _getRegularTheme(palette),
    };
  }

  // ---------------------------------------------------------------------------
  static ThemeData _getRegularTheme(Palette palette) => ThemeData(
    primarySwatch: palette.primarySwatch,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: palette.green,
    useMaterial3: true,
    scaffoldBackgroundColor: palette.white,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: palette.primarySwatch,
      accentColor: palette.green,
      backgroundColor: palette.white,
      errorColor: palette.red,
      brightness: Brightness.light,
    ).copyWith(surfaceContainerHighest: Colors.transparent),
    splashColor: palette.green.withValues(alpha: 0.06),
    highlightColor: palette.green.withValues(alpha: 0.06),
    splashFactory: InkRipple.splashFactory,
    textTheme: TextTheme(
      headlineLarge: AppFonts.mainTitle.copyWith(color: palette.black),
      headlineMedium: AppFonts.initials.copyWith(color: palette.white),
      titleMedium: AppFonts.username.copyWith(color: palette.blackDark),
      bodyMedium: AppFonts.message.copyWith(color: palette.black),
      labelLarge: AppFonts.hint.copyWith(color: palette.gray),
      labelMedium: AppFonts.dividerLabel.copyWith(color: palette.gray),
      labelSmall: AppFonts.caption.copyWith(color: palette.grayDark),
    ),
  );
}
