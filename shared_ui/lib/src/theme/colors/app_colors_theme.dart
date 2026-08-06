import 'package:flutter/material.dart';
import 'package:shared_ui/src/theme/colors/color_roles/color_roles.dart';

/// Role-based colors exposed to widgets via `context.colors`.
abstract class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  const AppColorsTheme();

  AppBackgroundColors get background;

  AppTextColors get text;

  AppBorderColors get border;

  AppIconColors get icon;

  AppAccentColors get accent;

  AppFeedbackColors get feedback;

  AppChatColors get chat;

  AppShadowColors get shadow;

  AppSplashColors get splash;

  MaterialColor get primarySwatch;

  Brightness get statusBarIconBrightness;

  Brightness get statusBarBrightness;

  @override
  ThemeExtension<AppColorsTheme> copyWith() => this;

  @override
  ThemeExtension<AppColorsTheme> lerp(covariant ThemeExtension<AppColorsTheme>? other, double t) =>
      this;
}
