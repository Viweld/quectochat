import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../presentation/theme/dynamic_theme.dart';
import '../../presentation/values/palette.dart';

/// расширение для сокращенного доступа к стилям текста и цветам
extension ContextExtension on BuildContext {
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  /// **Заголовок на главном экране**
  ///
  /// fontSize: 32,
  ///
  /// fontWeight: FontWeight.w600,
  TextStyle? get style32w600$mainTitle =>
      DynamicTheme.themeOf(this)?.textTheme.headlineLarge;

  /// **Инициалы**
  ///
  /// fontSize: 20,
  ///
  /// fontWeight: FontWeight.w700,
  TextStyle? get style20w700$initials =>
      DynamicTheme.themeOf(this)?.textTheme.headlineMedium;

  /// **Имя пользователя**
  ///
  /// fontSize: 15,
  ///
  /// fontWeight: FontWeight.w600,
  TextStyle? get style15w600$username =>
      DynamicTheme.themeOf(this)?.textTheme.titleMedium;

  /// **Текст в сообщениях**
  ///
  /// fontSize: 14,
  ///
  /// fontWeight: FontWeight.w500,
  TextStyle? get style14w500$message =>
      DynamicTheme.themeOf(this)?.textTheme.bodyMedium;

  /// **Хинты**
  ///
  /// fontSize: 16,
  ///
  /// fontWeight: FontWeight.w500,
  TextStyle? get style16w500$hint =>
      DynamicTheme.themeOf(this)?.textTheme.labelLarge;

  /// **Надписи в разделителях в чате**
  ///
  /// fontSize: 14,
  ///
  /// fontWeight: FontWeight.w500,
  TextStyle? get style14w500$dividerLabel =>
      DynamicTheme.themeOf(this)?.textTheme.labelMedium;

  /// **Подписи "Вчера", "В сети", "09:23" и т.п.**
  ///
  /// fontSize: 12,
  ///
  /// fontWeight: FontWeight.w500,
  TextStyle? get style12w500$labels =>
      DynamicTheme.themeOf(this)?.textTheme.labelSmall;

  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  /// Предоставляет динамическую палитру цветов
  Palette get palette => DynamicTheme.paletteOf(this);

  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  /// Предоставляет динамический набор текстов и надписей
  AppLocalizations get texts => AppLocalizations.of(this)!;
}
