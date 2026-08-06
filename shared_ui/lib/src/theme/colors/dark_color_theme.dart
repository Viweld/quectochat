import 'package:flutter/material.dart';
import 'package:shared_ui/src/theme/colors/app_colors.dart';
import 'package:shared_ui/src/theme/colors/app_colors_theme.dart';
import 'package:shared_ui/src/theme/colors/color_roles/color_roles.dart';

final class DarkColorTheme extends AppColorsTheme {
  const DarkColorTheme();

  @override
  AppBackgroundColors get background => const AppBackgroundColors(
    main: AppDarkColors.background,
    secondary: AppDarkColors.backgroundSecondary,
    inverse: AppDarkColors.backgroundInverse,
  );

  @override
  AppTextColors get text => const AppTextColors(
    main: AppDarkColors.text,
    strong: AppDarkColors.textStrong,
    secondary: AppDarkColors.textSecondary,
    tertiary: AppDarkColors.textTertiary,
    inverse: AppDarkColors.textInverse,
    onAccent: AppDarkColors.onAccent,
    error: AppDarkColors.error,
  );

  @override
  AppBorderColors get border => const AppBorderColors(main: AppDarkColors.border);

  @override
  AppIconColors get icon => const AppIconColors(
    main: AppDarkColors.text,
    secondary: AppDarkColors.textTertiary,
    inverse: AppDarkColors.textInverse,
  );

  @override
  AppAccentColors get accent => const AppAccentColors(main: AppDarkColors.accent);

  @override
  AppFeedbackColors get feedback => const AppFeedbackColors(error: AppDarkColors.error);

  @override
  AppChatColors get chat => AppChatColors(
    bubbleOwn: AppDarkColors.accent.withValues(alpha: 0.45),
    bubblePeer: AppDarkColors.textTertiary.withValues(alpha: 0.45),
    bubbleOwnText: AppDarkColors.textStrong,
  );

  @override
  AppShadowColors get shadow => const AppShadowColors(main: AppDarkColors.shadow);

  @override
  AppSplashColors get splash => const AppSplashColors(main: AppDarkColors.splash);

  @override
  MaterialColor get primarySwatch => AppDarkColors.primarySwatch;

  @override
  Brightness get statusBarIconBrightness => AppDarkColors.statusBarIconBrightness;

  @override
  Brightness get statusBarBrightness => AppDarkColors.statusBarBrightness;
}
