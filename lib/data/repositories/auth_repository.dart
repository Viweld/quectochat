import 'dart:async';

import 'package:quectochat/domain/interfaces/i_auth_repository.dart';
import 'package:quectochat/domain/models/current_user.dart';

import '../../domain/interfaces/i_api_facade.dart';

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
  Future<CurrentUser?> logIn({
    required String email,
    required String password,
  }) async {
    final currentUser = await _networkFacade.logIn(
      email: email,
      password: password,
    );

    _authStatus = AuthStatus.authorized;
    if (!_authStreamController.isClosed) _authStreamController.add(_authStatus);
    return currentUser;
  }

  @override
  Future<void> logOut() async {
    await _networkFacade.logOut();

    _authStatus = AuthStatus.notAuthorized;
    if (!_authStreamController.isClosed) _authStreamController.add(_authStatus);
  }

  @override
  Future<CurrentUser?> registration({
    required String email,
    required String password,
  }) async {
    final newUser = await _networkFacade.registration(
      email: email,
      password: password,
    );

    _authStatus = AuthStatus.authorized;
    if (!_authStreamController.isClosed) _authStreamController.add(_authStatus);
    return newUser;
  }
}
