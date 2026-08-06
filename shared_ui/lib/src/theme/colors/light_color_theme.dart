import 'package:flutter/material.dart';
import 'package:shared_ui/src/theme/colors/app_colors.dart';
import 'package:shared_ui/src/theme/colors/app_colors_theme.dart';
import 'package:shared_ui/src/theme/colors/color_roles/color_roles.dart';

final class LightColorTheme extends AppColorsTheme {
  const LightColorTheme();

  @override
  AppBackgroundColors get background => const AppBackgroundColors(
    main: AppColors.background,
    secondary: AppColors.backgroundSecondary,
    inverse: AppColors.backgroundInverse,
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
  AppAccentColors get accent => const AppAccentColors(main: AppColors.accent);

  @override
  AppFeedbackColors get feedback => const AppFeedbackColors(error: AppColors.error);

  @override
  AppChatColors get chat => AppChatColors(
    bubbleOwn: AppColors.accent.withValues(alpha: 0.5),
    bubblePeer: AppColors.textTertiary.withValues(alpha: 0.5),
    bubbleOwnText: AppColors.onAccent,
  );

  @override
  AppShadowColors get shadow => const AppShadowColors(main: AppColors.shadow);

  @override
  AppSplashColors get splash => const AppSplashColors(main: AppColors.splash);

  @override
  MaterialColor get primarySwatch => AppColors.primarySwatch;

  @override
  Brightness get statusBarIconBrightness => AppColors.statusBarIconBrightness;

  @override
  Brightness get statusBarBrightness => AppColors.statusBarBrightness;
}
