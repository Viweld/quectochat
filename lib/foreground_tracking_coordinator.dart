import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_domain/shared_domain.dart';

/// Starts delivery ACK, presence and badge tracking when authorized and resumed.
final class ForegroundTrackingCoordinator {
  ForegroundTrackingCoordinator({
    required AuthenticationStatePort authenticationStatePort,
    required ChatDeliveryAckPort chatDeliveryAckPort,
    required PresencePort presencePort,
    required BadgeSyncPort badgeSyncPort,
  }) : _authenticationStatePort = authenticationStatePort,
       _chatDeliveryAckPort = chatDeliveryAckPort,
       _presencePort = presencePort,
       _badgeSyncPort = badgeSyncPort;

  final AuthenticationStatePort _authenticationStatePort;
  final ChatDeliveryAckPort _chatDeliveryAckPort;
  final PresencePort _presencePort;
  final BadgeSyncPort _badgeSyncPort;

  StreamSubscription<AuthStatus>? _authSubscription;
  AppLifecycleListener? _lifecycleListener;
  AppLifecycleState? _lastLifecycle;
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
        _badgeSyncPort.stopTracking(),
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
    final bool resumedFromBackground =
        lifecycle == AppLifecycleState.resumed &&
        (_lastLifecycle == AppLifecycleState.paused ||
            _lastLifecycle == AppLifecycleState.hidden ||
            _lastLifecycle == AppLifecycleState.detached);
    _lastLifecycle = lifecycle;

    if (shouldTrack) {
      // Always (re)attempt start: services are idempotent, but a previous attempt
      // may have no-oped when the session was not ready yet.
      _isTracking = true;
      unawaited(_chatDeliveryAckPort.startTracking());
      if (resumedFromBackground) {
        unawaited(_restartPresenceTracking());
      } else {
        unawaited(_presencePort.startTracking());
      }
      unawaited(_badgeSyncPort.startTracking());
      return;
    }

    if (!_isTracking) return;
    _isTracking = false;
    unawaited(_chatDeliveryAckPort.stopTracking());
    unawaited(_presencePort.stopTracking());
    unawaited(_badgeSyncPort.stopTracking());
  }

  /// Drops a possibly stale realtime presence channel after returning from background.
  Future<void> _restartPresenceTracking() async {
    await _presencePort.stopTracking();
    await _presencePort.startTracking();
  }
}
