import 'package:flutter/material.dart';
import 'package:shared_ui/src/theme/colors/app_colors.dart';

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

  MaterialColor get primarySwatch;

  Brightness get statusBarIconBrightness;

  Brightness get statusBarBrightness;

  @override
  ThemeExtension<AppColorsTheme> copyWith() => this;

  @override
  ThemeExtension<AppColorsTheme> lerp(covariant ThemeExtension<AppColorsTheme>? other, double t) =>
      this;
}

final class AppBackgroundColors {
  const AppBackgroundColors({required this.main, required this.secondary});

  final Color main;
  final Color secondary;
}

final class AppTextColors {
  const AppTextColors({
    required this.main,
    required this.strong,
    required this.secondary,
    required this.tertiary,
    required this.inverse,
    required this.onAccent,
    required this.error,
  });

  final Color main;
  final Color strong;
  final Color secondary;
  final Color tertiary;
  final Color inverse;
  final Color onAccent;
  final Color error;
}

final class AppBorderColors {
  const AppBorderColors({required this.main});

  final Color main;
}

final class AppIconColors {
  const AppIconColors({required this.main, required this.secondary, required this.inverse});

  final Color main;
  final Color secondary;
  final Color inverse;
}

final class AppAccentColors {
  const AppAccentColors({required this.main, required this.splash});

  final Color main;
  final Color splash;
}

final class AppFeedbackColors {
  const AppFeedbackColors({required this.error});

  final Color error;
}

final class AppChatColors {
  const AppChatColors({
    required this.bubbleOwn,
    required this.bubblePeer,
    required this.bubbleOwnText,
  });

  final Color bubbleOwn;
  final Color bubblePeer;
  final Color bubbleOwnText;
}

final class LightColorTheme extends AppColorsTheme {
  const LightColorTheme();

  @override
  AppBackgroundColors get background => const AppBackgroundColors(
    main: AppColors.background,
    secondary: AppColors.backgroundSecondary,
  );

  @override
  AppTextColors get text => const AppTextColors(
    main: AppColors.text,
    strong: AppColors.textStrong,
    secondary: AppColors.textSecondary,
    tertiary: AppColors.textTertiary,
    inverse: AppColors.textInverse,
    onAccent: AppColors.onAccent,
    error: AppColors.error,
  );

  @override
  AppBorderColors get border => const AppBorderColors(main: AppColors.border);

  @override
  AppIconColors get icon => const AppIconColors(
    main: AppColors.text,
    secondary: AppColors.textTertiary,
    inverse: AppColors.textInverse,
  );

  @override
  AppAccentColors get accent =>
      AppAccentColors(main: AppColors.accent, splash: AppColors.accent.withValues(alpha: 0.06));

  @override
  AppFeedbackColors get feedback => const AppFeedbackColors(error: AppColors.error);

  @override
  AppChatColors get chat => const AppChatColors(
    bubbleOwn: AppColors.accent,
    bubblePeer: AppColors.textTertiary,
    bubbleOwnText: AppColors.onAccent,
  );

  @override
  MaterialColor get primarySwatch => AppColors.primarySwatch;

  @override
  Brightness get statusBarIconBrightness => AppColors.statusBarIconBrightness;

  @override
  Brightness get statusBarBrightness => AppColors.statusBarBrightness;
}
