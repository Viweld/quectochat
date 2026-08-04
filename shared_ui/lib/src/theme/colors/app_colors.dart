import 'package:flutter/material.dart';

/// Raw semantic light palette. Widgets must use AppColorsTheme via `context.colors`.
abstract final class AppColors {
  static const Color background = Color(0xFFFFFFFF);
  static const Color backgroundSecondary = Color(0xFFFFF8F2);
  static const Color border = Color(0xFFB2D5E3);

  static const Color text = Color(0xFF2B333E);
  static const Color textStrong = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF5E7A90);
  static const Color textTertiary = Color(0xFFB2D5E3);
  static const Color textInverse = Color(0xFFFFFFFF);
  static const Color onAccent = Color(0xFF063A3D);

  static const Color accent = Color(0xFF1C9399);
  static const Color error = Color(0xFFBD5B47);

  static const int primaryValue = 0xFF1C9399;

  static const MaterialColor primarySwatch = MaterialColor(primaryValue, <int, Color>{
    50: Color(0xFFE8F6F7),
    100: Color(0xFFC5E8EA),
    200: Color(0xFF9FD7DB),
    300: Color(0xFF72C4C9),
    400: Color(0xFF45B2B7),
    500: Color(0xFF1C9399),
    600: Color(0xFF198487),
    700: Color(0xFF157175),
    800: Color(0xFF125F63),
    900: Color(0xFF0D4548),
  });

  static const Brightness statusBarIconBrightness = Brightness.dark;
  static const Brightness statusBarBrightness = Brightness.light;
}
