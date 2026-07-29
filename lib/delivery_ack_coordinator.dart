import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_domain/shared_domain.dart';

/// Starts delivery tracking when the user is authorized and the app is resumed.
final class DeliveryAckCoordinator {
  DeliveryAckCoordinator({
    required AuthenticationStatePort authenticationStatePort,
    required ChatDeliveryAckPort chatDeliveryAckPort,
  }) : _authenticationStatePort = authenticationStatePort,
       _chatDeliveryAckPort = chatDeliveryAckPort;

  final AuthenticationStatePort _authenticationStatePort;
  final ChatDeliveryAckPort _chatDeliveryAckPort;

  StreamSubscription<AuthStatus>? _authSubscription;
  AppLifecycleListener? _lifecycleListener;
  bool _isTracking = false;

  void start() {
    _authSubscription = _authenticationStatePort.authStatusStream.listen((_) => _sync());
    _lifecycleListener = AppLifecycleListener(onStateChange: (_) => _sync());
    _sync();
  }

  Future<void> dispose() async {
    await _authSubscription?.cancel();
    _authSubscription = null;
    _lifecycleListener?.dispose();
    _lifecycleListener = null;
    if (_isTracking) {
      _isTracking = false;
      await _chatDeliveryAckPort.stopTracking();
    }
  }

  void _sync() {
    final AppLifecycleState? lifecycle = WidgetsBinding.instance.lifecycleState;
    final bool shouldTrack =
        _authenticationStatePort.authStatus == AuthStatus.authorized &&
        lifecycle == AppLifecycleState.resumed;

    if (shouldTrack == _isTracking) return;
    _isTracking = shouldTrack;

    if (shouldTrack) {
      unawaited(_chatDeliveryAckPort.startTracking());
    } else {
      unawaited(_chatDeliveryAckPort.stopTracking());
    }
  }
}
