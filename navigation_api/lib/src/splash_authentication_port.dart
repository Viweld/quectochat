import 'package:shared_domain/shared_domain.dart';

/// Splash bootstrap access to auth session (subset of AuthRepository).
abstract interface class SplashAuthenticationPort {
  Future<void> checkAuth();

  AuthStatus get authStatus;
}
