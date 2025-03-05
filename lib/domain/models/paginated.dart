import 'package:flutter/foundation.dart';

/// Универсальный класс для постраничного (пагинированного) запроса данных
/// [T] - тип данных в результате запроса
@immutable
class Paginated<T> {
  const Paginated({
    required this.hasNext,
    required this.result,
  });

  /// Есть ли еще данные для загрузки (следующая страница)
  final bool hasNext;

  /// Результаты текущей страницы
  final Iterable<T> result;
}
