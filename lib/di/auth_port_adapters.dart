import 'package:auth/domain/repositories/auth_repository.dart';
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
    () => _AuthSessionPortAdapter(locator<AuthRepository>()),
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
  _AuthSessionPortAdapter(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<void> logOut() => _authRepository.logOut();
}

final class _CurrentUserPortAdapter implements CurrentUserPort {
  _CurrentUserPortAdapter(this._authRepository);

  final AuthRepository _authRepository;

  @override
  String get currentUserId => _authRepository.currentUserId;
}
