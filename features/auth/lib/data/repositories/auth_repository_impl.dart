import 'dart:async';

import 'package:auth/domain/entities/login_failure.dart';
import 'package:auth/domain/entities/registration_failure.dart';
import 'package:auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_domain/shared_domain.dart';

import '../datasources/auth_remote_data_source.dart';

@LazySingleton(as: AuthRepository)
final class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required AuthRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource,
      _authStreamController = StreamController<AuthStatus>.broadcast(),
      _authStatus = AuthStatus.notAuthorized;

  AuthStatus _authStatus;

  @override
  AuthStatus get authStatus => _authStatus;

  @override
  String get currentUserId => _remoteDataSource.currentUserId;

  @override
  Stream<AuthStatus> get authStatusStream => _authStreamController.stream;

  final AuthRemoteDataSource _remoteDataSource;
  final StreamController<AuthStatus> _authStreamController;

  @override
  Future<void> checkAuth() async {
    final bool isLoggedIn = await _remoteDataSource.checkAuth();
    _authStatus = isLoggedIn ? AuthStatus.authorized : AuthStatus.notAuthorized;
    if (!_authStreamController.isClosed) {
      _authStreamController.add(_authStatus);
    }
  }

  @override
  Future<Outcome<void, LoginFailure>> logIn({
    required String email,
    required String password,
  }) async {
    try {
      await _remoteDataSource.logIn(email: email, password: password);
      _authStatus = AuthStatus.authorized;
      if (!_authStreamController.isClosed) {
        _authStreamController.add(_authStatus);
      }
      return const Success(null);
    } on LoginFailure catch (failure) {
      return Failure(failure);
    }
  }

  @override
  Future<void> logOut() async {
    await _remoteDataSource.logOut();
    _authStatus = AuthStatus.notAuthorized;
    if (!_authStreamController.isClosed) {
      _authStreamController.add(_authStatus);
    }
  }

  @override
  Future<Outcome<void, RegistrationFailure>> registration({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      await _remoteDataSource.registration(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );
      _authStatus = AuthStatus.authorized;
      if (!_authStreamController.isClosed) {
        _authStreamController.add(_authStatus);
      }
      return const Success(null);
    } on RegistrationFailure catch (failure) {
      return Failure(failure);
    }
  }
}
