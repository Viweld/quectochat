import 'package:flutter/material.dart';
import 'package:shared_ui/src/theme/app_fonts.dart';
import 'package:shared_ui/src/theme/colors/app_colors.dart';
import 'package:shared_ui/src/theme/colors/app_colors_theme.dart';
import 'package:shared_ui/src/theme_type.dart';

class ThemeBuilder {
  static ThemeData getTheme(ThemeType type) {
    return switch (type) {
      ThemeType.regular => _getRegularTheme(),
    };
  }

  static ThemeData _getRegularTheme() {
    const AppColorsTheme colors = LightColorTheme();
    return ThemeData(
      primarySwatch: AppColors.primarySwatch,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: AppColors.accent,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      extensions: const <ThemeExtension<dynamic>>[LightColorTheme()],
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColors.primarySwatch,
        accentColor: AppColors.accent,
        backgroundColor: AppColors.background,
        errorColor: AppColors.error,
      ).copyWith(surfaceContainerHighest: Colors.transparent),
      splashColor: colors.accent.splash,
      highlightColor: colors.accent.splash,
      splashFactory: InkRipple.splashFactory,
      textTheme: TextTheme(
        headlineLarge: AppFonts.mainTitle.copyWith(color: AppColors.text),
        headlineMedium: AppFonts.initials.copyWith(color: AppColors.textInverse),
        titleMedium: AppFonts.username.copyWith(color: AppColors.textStrong),
        bodyMedium: AppFonts.message.copyWith(color: AppColors.text),
        labelLarge: AppFonts.hint.copyWith(color: AppColors.textTertiary),
        labelMedium: AppFonts.dividerLabel.copyWith(color: AppColors.textTertiary),
        labelSmall: AppFonts.caption.copyWith(color: AppColors.textSecondary),
      ),
    );
  }
}
