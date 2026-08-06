import 'package:flutter/material.dart';
import 'package:shared_ui/src/theme/app_fonts.dart';
import 'package:shared_ui/src/theme/colors/app_colors_theme.dart';
import 'package:shared_ui/src/theme/colors/dark_color_theme.dart';
import 'package:shared_ui/src/theme/colors/light_color_theme.dart';
import 'package:shared_ui/src/theme_type.dart';

class ThemeBuilder {
  static ThemeData getTheme(ThemeType type) {
    return switch (type) {
      ThemeType.regular => _buildTheme(const LightColorTheme(), Brightness.light),
      ThemeType.dark => _buildTheme(const DarkColorTheme(), Brightness.dark),
    };
  }

  static ThemeData _buildTheme(AppColorsTheme colors, Brightness brightness) {
    return ThemeData(
      brightness: brightness,
      primarySwatch: colors.primarySwatch,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: colors.accent.main,
      useMaterial3: true,
      scaffoldBackgroundColor: colors.background.main,
      extensions: <ThemeExtension<dynamic>>[colors],
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: colors.primarySwatch,
        accentColor: colors.accent.main,
        backgroundColor: colors.background.main,
        errorColor: colors.feedback.error,
        brightness: brightness,
      ).copyWith(surfaceContainerHighest: Colors.transparent),
      splashColor: colors.splash.main,
      highlightColor: colors.splash.main,
      splashFactory: InkRipple.splashFactory,
      textTheme: TextTheme(
        headlineLarge: AppFonts.mainTitle.copyWith(color: colors.text.main),
        headlineMedium: AppFonts.initials.copyWith(color: colors.text.inverse),
        titleMedium: AppFonts.username.copyWith(color: colors.text.strong),
        bodyMedium: AppFonts.message.copyWith(color: colors.text.main),
        labelLarge: AppFonts.hint.copyWith(color: colors.text.tertiary),
        labelMedium: AppFonts.dividerLabel.copyWith(color: colors.text.tertiary),
        labelSmall: AppFonts.caption.copyWith(color: colors.text.secondary),
      ),
    );
  }
}
