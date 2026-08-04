import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';

/// Registers and rotates FCM tokens while the user is authorized.
final class PushTokenCoordinator {
  PushTokenCoordinator({
    required AuthenticationStatePort authenticationStatePort,
    required PushNotificationPort pushNotificationPort,
  }) : _authenticationStatePort = authenticationStatePort,
       _pushNotificationPort = pushNotificationPort;

  final AuthenticationStatePort _authenticationStatePort;
  final PushNotificationPort _pushNotificationPort;

  StreamSubscription<AuthStatus>? _authSubscription;
  StreamSubscription<String>? _tokenRefreshSubscription;
  bool _isRegistering = false;

  void start() {
    _authSubscription = _authenticationStatePort.authStatusStream.listen((_) {
      unawaited(_sync());
    });
    unawaited(_sync());
  }

  Future<void> dispose() async {
    await _authSubscription?.cancel();
    _authSubscription = null;
    await _tokenRefreshSubscription?.cancel();
    _tokenRefreshSubscription = null;
  }

  Future<void> _sync() async {
    if (!Platform.isAndroid && !Platform.isIOS) return;

    final bool isAuthorized = _authenticationStatePort.authStatus == AuthStatus.authorized;
    if (isAuthorized) {
      await _registerCurrentToken();
      return;
    }

    await _unregisterCurrentToken();
  }

  Future<void> _registerCurrentToken() async {
    if (_isRegistering) return;
    _isRegistering = true;

    try {
      final FirebaseMessaging messaging = FirebaseMessaging.instance;
      await messaging.requestPermission();
      final String? token = await messaging.getToken();
      if (token == null || token.isEmpty) return;

      final String platform = Platform.isIOS ? 'ios' : 'android';
      await _pushNotificationPort.registerDeviceToken(token: token, platform: platform);

      await _tokenRefreshSubscription?.cancel();
      _tokenRefreshSubscription = messaging.onTokenRefresh.listen((String refreshed) {
        unawaited(_onTokenRefreshed(refreshed, platform));
      });
    } on Object catch (error, stackTrace) {
      logInfrastructureFailure(
        'Failed to register FCM token',
        name: 'PushTokenCoordinator',
        error: error,
        stackTrace: stackTrace,
      );
    } finally {
      _isRegistering = false;
    }
  }

  Future<void> _onTokenRefreshed(String refreshed, String platform) async {
    try {
      await _pushNotificationPort.registerDeviceToken(token: refreshed, platform: platform);
    } on Object catch (error, stackTrace) {
      logInfrastructureFailure(
        'Failed to refresh FCM token',
        name: 'PushTokenCoordinator',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _unregisterCurrentToken() async {
    await _tokenRefreshSubscription?.cancel();
    _tokenRefreshSubscription = null;
  }
}
