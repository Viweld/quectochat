import 'package:flutter/material.dart';

class CommonPaginationListener extends StatelessWidget {
  const CommonPaginationListener({
    required this.listenableChild,
    required this.onListEnded,
    this.actuationRange = 500,
    super.key,
  });

  /// listenableChild: Прослушиваемый потомок (скролящиеся списки ListView,
  /// CustomScrollView, SingleChildScrollView и т.п.)
  final Widget listenableChild;

  /// onListEnded: Коллбэк вызываемый при достижении конца списка
  final void Function() onListEnded;

  /// actuationRangeLength: Длина участка срабатывания ("припуск внизу списка")
  final double actuationRange;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollMetricsNotification>(
      onNotification: _onScrollNotification,
      child: listenableChild,
    );
  }

  // ---------------------------------------------------------------------------
  /// Анализирует результат прокрутки списка [listenableChild] и вызывает коллбэк [onListEnded]
  /// при достижении участка срабатывания [actuationRange] в конце списка
  bool _onScrollNotification(ScrollMetricsNotification notification) {
    final scrolledToBottom = notification.metrics.extentAfter < actuationRange;
    if (scrolledToBottom) onListEnded.call();
    return false;
  }
}
