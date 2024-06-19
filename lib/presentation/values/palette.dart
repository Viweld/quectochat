import 'package:flutter/material.dart';

class Palette {
  final int palettePrimaryValue;
  final MaterialColor primarySwatch;

  // Палитра макета;
  final Color white;
  final Color stroke;
  final Color gray;
  final Color grayDark;
  final Color black;
  final Color blackDark;
  final Color green;
  final Color greenDark;
  final Color red;

  // ---------------------------------------------------------------------------
  Palette.regular()
      : palettePrimaryValue = 0xFF3CED78,
        primarySwatch = const MaterialColor(0xFF3CED78, <int, Color>{
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
        }),

        // Палитра макета (dark)
        white = const Color(0xFFFFFFFF),
        stroke = const Color(0xFFEDF2F6),
        gray = const Color(0xFF9DB7CB),
        grayDark = const Color(0xFF5E7A90),
        black = const Color(0xFF2B333E),
        blackDark = const Color(0xFF000000),
        green = const Color(0xFF3CED78),
        greenDark = const Color(0xFF00521C),
        red = const Color(0xFFF88383);
}
