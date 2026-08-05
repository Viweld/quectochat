import 'package:flutter/foundation.dart';

/// Метаданные сборки приложения, доступные всем слоям.
///
/// Значения читаются из бандла в Composition Root — сам тип не зависит
/// от платформенных плагинов.
@immutable
final class AppInfo {
  const AppInfo({required this.version, required this.buildNumber});

  /// Версия приложения, например `1.0.0`.
  final String version;

  /// Номер сборки, например `1`.
  final String buildNumber;
}
