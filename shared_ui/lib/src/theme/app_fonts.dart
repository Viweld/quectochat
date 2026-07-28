import 'package:flutter/material.dart';

/// Gilroy-based typography primitives for [ThemeBuilder].
abstract final class AppFonts {
  static const TextStyle base = TextStyle(
    fontSize: 14,
    height: 1.225,
    fontWeight: FontWeight.w500,
    fontFamily: 'Gilroy',
    fontFamilyFallback: ['sans-serif'],
  );

  /// Заголовок на главном экране.
  static TextStyle get mainTitle => base.copyWith(fontSize: 32, fontWeight: FontWeight.w600);

  /// Инициалы в аватаре.
  static TextStyle get initials => base.copyWith(fontSize: 20, fontWeight: FontWeight.w700);

  /// Имя пользователя.
  static TextStyle get username => base.copyWith(fontSize: 15, fontWeight: FontWeight.w600);

  /// Текст в сообщениях.
  static TextStyle get message => base.copyWith(fontSize: 14, fontWeight: FontWeight.w500);

  /// Хинты в полях ввода.
  static TextStyle get hint => base.copyWith(fontSize: 16, fontWeight: FontWeight.w500);

  /// Надписи в разделителях в чате.
  static TextStyle get dividerLabel => base.copyWith(fontSize: 14, fontWeight: FontWeight.w500);

  /// Подписи «Вчера», «В сети», «09:23» и т.п.
  static TextStyle get caption => base.copyWith(fontSize: 12, fontWeight: FontWeight.w500);
}
