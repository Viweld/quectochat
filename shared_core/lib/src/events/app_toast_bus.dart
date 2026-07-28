import 'dart:async';

import 'package:injectable/injectable.dart';

import 'app_toast_events.dart';

@lazySingleton
final class AppToastBus {
  AppToastBus() : _controller = StreamController<AppToastEvent>.broadcast();

  final StreamController<AppToastEvent> _controller;
  DateTime? _lastFiredAt;
  AppToastEvent? _lastEvent;

  static const Duration _throttleDuration = Duration(seconds: 2);

  Stream<AppToastEvent> get stream => _controller.stream;

  void fire(AppToastEvent event) {
    if (_shouldThrottle(event)) return;

    _lastFiredAt = DateTime.now();
    _lastEvent = event;
    _controller.add(event);
  }

  bool _shouldThrottle(AppToastEvent event) {
    if (_lastFiredAt == null || _lastEvent == null) return false;

    final Duration elapsed = DateTime.now().difference(_lastFiredAt!);
    if (elapsed >= _throttleDuration) return false;

    if (event is ErrorToastEvent && _lastEvent is ErrorToastEvent) {
      final ErrorToastEvent last = _lastEvent! as ErrorToastEvent;
      final ErrorToastEvent current = event;
      return last.errorKind == current.errorKind && last.message == current.message;
    }

    return false;
  }

  @disposeMethod
  void dispose() {
    _controller.close();
  }
}
