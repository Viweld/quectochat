import 'package:flutter/material.dart';

import '../../domain/models/theme_type.dart';
import '../values/palette.dart';

class ThemeBuilder {
  static const TextStyle _globalTextStyle = TextStyle(
    fontSize: 14,
    height: 1.225,
    fontWeight: FontWeight.w500,
    fontFamily: 'Gilroy',
    fontFamilyFallback: ['sans-serif'],
  );

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
        ).copyWith(surfaceVariant: Colors.transparent),
        splashColor: palette.green.withOpacity(0.06),
        highlightColor: palette.green.withOpacity(0.06),
        splashFactory: InkRipple.splashFactory,
        textTheme: TextTheme(
          /// Заголовок на главном экране
          headlineLarge: _globalTextStyle.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: palette.black,
          ),

          /// Инициалы
          headlineMedium: _globalTextStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: palette.white,
          ),

          /// Имя пользователя
          titleMedium: _globalTextStyle.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: palette.blackDark,
          ),

          /// Текст в сообщениях
          bodyMedium: _globalTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: palette.black,
          ),

          /// Хинты
          labelLarge: _globalTextStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: palette.gray,
          ),

          /// Надписи в разделителях в чате
          labelMedium: _globalTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: palette.gray,
          ),

          /// Подписи "Вчера", "В сети", "09:23" и т.п.
          labelSmall: _globalTextStyle.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: palette.grayDark,
          ),
        ),
      );
}
