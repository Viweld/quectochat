import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:auth/domain/repositories/auth_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';

/// Wires auth feature implementations to cross-feature ports (Composition Root).
void registerAuthPorts(GetIt locator) {
  locator.registerLazySingleton<AuthenticationStatePort>(
    () => _AuthenticationStatePortAdapter(locator<AuthRepository>()),
  );
  locator.registerLazySingleton<SplashAuthenticationPort>(
    () => _SplashAuthenticationPortAdapter(locator<AuthRepository>()),
  );
  locator.registerLazySingleton<AuthSessionPort>(
    () => _AuthSessionPortAdapter(locator<AuthRepository>(), locator<PushNotificationPort>()),
  );
  locator.registerLazySingleton<CurrentUserPort>(
    () => _CurrentUserPortAdapter(locator<AuthRepository>()),
  );
}

final class _AuthenticationStatePortAdapter implements AuthenticationStatePort {
  _AuthenticationStatePortAdapter(this._authRepository);

  final AuthRepository _authRepository;

  @override
  AuthStatus get authStatus => _authRepository.authStatus;

  @override
  Stream<AuthStatus> get authStatusStream => _authRepository.authStatusStream;
}

final class _SplashAuthenticationPortAdapter implements SplashAuthenticationPort {
  _SplashAuthenticationPortAdapter(this._authRepository);

  final AuthRepository _authRepository;

  @override
  AuthStatus get authStatus => _authRepository.authStatus;

  @override
  Future<void> checkAuth() => _authRepository.checkAuth();
}

final class _AuthSessionPortAdapter implements AuthSessionPort {
  _AuthSessionPortAdapter(this._authRepository, this._pushNotificationPort);

  final AuthRepository _authRepository;
  final PushNotificationPort _pushNotificationPort;

  @override
  Future<void> logOut() async {
    await _unregisterPushTokenSafely();
    await _authRepository.logOut();
  }

  Future<void> _unregisterPushTokenSafely() async {
    if (!Platform.isAndroid && !Platform.isIOS) return;

    try {
      final String? token = await FirebaseMessaging.instance.getToken();
      await _pushNotificationPort.unregisterCurrentDevice(fallbackToken: token);
    } on Object catch (error, stackTrace) {
      log(
        'Failed to unregister FCM token before logout',
        name: 'AuthSessionPort',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}

final class _CurrentUserPortAdapter implements CurrentUserPort {
  _CurrentUserPortAdapter(this._authRepository);

  final AuthRepository _authRepository;

  @override
  String get currentUserId => _authRepository.currentUserId;
}
