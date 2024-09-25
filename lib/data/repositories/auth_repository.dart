import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:quectochat/domain/interfaces/i_auth_repository.dart';

import '../../domain/interfaces/i_api_facade.dart';

@Singleton(as: IAuthRepository)
final class AuthRepository implements IAuthRepository {
  AuthRepository({
    required INetworkFacade networkFacade,
  }) : _networkFacade = networkFacade {
    _authStreamController = StreamController<AuthStatus>.broadcast();
    _authStatus = _initialAuthStatus;
  }

  static const AuthStatus _initialAuthStatus = AuthStatus.notAuthorized;

  // СОСТОЯНИЕ:
  // ---------------------------------------------------------------------------
  late AuthStatus _authStatus;

  @override
  AuthStatus get authStatus => _authStatus;

  // ЗАВИСИМОСТИ:
  // ---------------------------------------------------------------------------
  final INetworkFacade _networkFacade;

  // СТРИМ:
  // ---------------------------------------------------------------------------
  late final StreamController<AuthStatus> _authStreamController;

  @override
  AuthSubscription subscribe(Function(AuthStatus) listener) {
    return _authStreamController.stream.listen(listener);
  }

  @override
  Future<void> close() async {
    await _authStreamController.close();
  }

  // МЕТОДЫ:
  // ---------------------------------------------------------------------------
  @override
  void checkAuth() {
    final isLoggedIn = _networkFacade.checkAuth();
    _authStatus = isLoggedIn ? AuthStatus.authorized : AuthStatus.notAuthorized;
    if (!_authStreamController.isClosed) _authStreamController.add(_authStatus);
  }

  @override
  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    await _networkFacade.logIn(email: email, password: password);
    _authStatus = AuthStatus.authorized;
    if (!_authStreamController.isClosed) _authStreamController.add(_authStatus);
  }

  @override
  Future<void> logOut() async {
    await _networkFacade.logOut();
    _authStatus = AuthStatus.notAuthorized;
    if (!_authStreamController.isClosed) _authStreamController.add(_authStatus);
  }

  @override
  Future<void> registration({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    await _networkFacade.registration(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
    _authStatus = AuthStatus.authorized;
    if (!_authStreamController.isClosed) _authStreamController.add(_authStatus);
  }
}
