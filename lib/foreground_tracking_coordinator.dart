import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_domain/shared_domain.dart';

/// Starts delivery ACK and presence tracking when authorized and resumed.
final class ForegroundTrackingCoordinator {
  ForegroundTrackingCoordinator({
    required AuthenticationStatePort authenticationStatePort,
    required ChatDeliveryAckPort chatDeliveryAckPort,
    required PresencePort presencePort,
  }) : _authenticationStatePort = authenticationStatePort,
       _chatDeliveryAckPort = chatDeliveryAckPort,
       _presencePort = presencePort;

  final AuthenticationStatePort _authenticationStatePort;
  final ChatDeliveryAckPort _chatDeliveryAckPort;
  final PresencePort _presencePort;

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
      await Future.wait(<Future<void>>[
        _chatDeliveryAckPort.stopTracking(),
        _presencePort.stopTracking(),
      ]);
    }
  }

  void _sync() {
    final AppLifecycleState? lifecycle = WidgetsBinding.instance.lifecycleState;
    // Before the first frame lifecycle may be null — treat as foreground.
    final bool isForeground =
        lifecycle == null ||
        lifecycle == AppLifecycleState.resumed ||
        lifecycle == AppLifecycleState.inactive;
    final bool shouldTrack =
        _authenticationStatePort.authStatus == AuthStatus.authorized && isForeground;

    if (shouldTrack) {
      // Always (re)attempt start: services are idempotent, but a previous attempt
      // may have no-oped when the session was not ready yet.
      _isTracking = true;
      unawaited(_chatDeliveryAckPort.startTracking());
      unawaited(_presencePort.startTracking());
      return;
    }

    if (!_isTracking) return;
    _isTracking = false;
    unawaited(_chatDeliveryAckPort.stopTracking());
    unawaited(_presencePort.stopTracking());
  }
}
