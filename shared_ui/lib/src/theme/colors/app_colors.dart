import 'package:flutter/material.dart';

/// Raw semantic light palette. Widgets must use AppColorsTheme via `context.colors`.
abstract final class AppColors {
  static const Color background = Color(0xFFFFFFFF);
  static const Color backgroundSecondary = Color(0xFFEDF2F6);
  static const Color border = Color(0xFFEDF2F6);

  static const Color text = Color(0xFF2B333E);
  static const Color textStrong = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF5E7A90);
  static const Color textTertiary = Color(0xFF9DB7CB);
  static const Color textInverse = Color(0xFFFFFFFF);
  static const Color onAccent = Color(0xFF00521C);

  static const Color accent = Color(0xFF3CED78);
  static const Color error = Color(0xFFF88383);

  static const int primaryValue = 0xFF3CED78;

  static const MaterialColor primarySwatch = MaterialColor(primaryValue, <int, Color>{
    50: Color(0xFFE8FDEF),
    100: Color(0xFFC5FAD7),
    200: Color(0xFF9EF6BC),
    300: Color(0xFF77F2A1),
    400: Color(0xFF59F08C),
    500: Color(0xFF3CED78),
    600: Color(0xFF36EB70),
    700: Color(0xFF2EE865),
    800: Color(0xFF27E55B),
    900: Color(0xFF1AE048),
  });

  static const Brightness statusBarIconBrightness = Brightness.dark;
  static const Brightness statusBarBrightness = Brightness.light;
}
