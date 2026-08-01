import 'dart:developer';

import 'package:auth/data/datasources/auth_remote_data_source.dart';
import 'package:auth/data/datasources/table_keys.dart';
import 'package:auth/data/dto/user_dto.dart';
import 'package:auth/domain/entities/login_failure.dart';
import 'package:auth/domain/entities/registration_failure.dart';
import 'package:shared_core/core.dart' hide AuthException;
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: AuthRemoteDataSource)
final class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl() : _client = Supabase.instance.client;

  final SupabaseClient _client;

  @override
  String get currentUserId => _client.auth.currentUser?.id ?? '';

  @override
  Future<bool> checkAuth() async {
    final Session? session = _client.auth.currentSession;
    if (session != null) {
      return true;
    }

    try {
      final AuthResponse response = await _client.auth.refreshSession();
      return response.session != null;
    } on AuthException {
      return false;
    } on Object {
      return _client.auth.currentSession != null;
    }
  }

  @override
  Future<void> logIn({required String email, required String password}) async {
    try {
      await _client.auth.signInWithPassword(email: email, password: password);
    } on AuthException catch (error) {
      throw _mapLoginFailure(error);
    } on Object catch (error, stackTrace) {
      throw _mapOrRethrowLoginTransportFailure(error, stackTrace);
    }
  }

  @override
  Future<void> registration({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse response = await _client.auth.signUp(email: email, password: password);

      final String? userId = response.user?.id;
      if (userId == null) {
        Error.throwWithStackTrace('Registration failed', StackTrace.current);
      }

      final UserDto userDto = UserDto(firstName: firstName, lastName: lastName);
      await _client.from(TableKeys.profiles).upsert(userDto.toJson(userId: userId));
    } on RegistrationFailure {
      rethrow;
    } on AuthException catch (error) {
      throw _mapRegistrationFailure(error);
    } on PostgrestException catch (error) {
      log(
        'Registration PostgrestException code=${error.code} message=${error.message}',
        name: 'AuthRemoteDataSource',
      );
      throw _mapRegistrationPostgrestFailure(error);
    } on Object catch (error, stackTrace) {
      throw _mapOrRethrowRegistrationTransportFailure(error, stackTrace);
    }
  }

  @override
  Future<void> logOut() async {
    await _client.auth.signOut();
  }

  LoginFailure _mapLoginFailure(AuthException error) {
    final TransportErrorKind transportKind = classifyTransportFailureText(error.message);
    if (transportKind == TransportErrorKind.network) {
      return const LoginNetworkFailure();
    }
    if (transportKind == TransportErrorKind.server) {
      return const LoginBackendFailure();
    }

    final String code = error.code ?? '';
    final String message = error.message.toLowerCase();

    if (code == 'invalid_credentials' || message.contains('invalid login')) {
      return const InvalidCredentialFailure();
    }
    if (code == 'user_not_found' || message.contains('user not found')) {
      return const UserNotFoundFailure();
    }
    if (code == 'invalid_credentials' && message.contains('password')) {
      return const WrongPasswordFailure();
    }
    return const InvalidCredentialFailure();
  }

  Never _mapOrRethrowLoginTransportFailure(Object error, StackTrace stackTrace) {
    switch (classifyTransportError(error)) {
      case TransportErrorKind.network:
        throw const LoginNetworkFailure();
      case TransportErrorKind.server:
        throw const LoginBackendFailure();
      case TransportErrorKind.other:
        Error.throwWithStackTrace(error, stackTrace);
    }
  }

  RegistrationFailure _mapRegistrationFailure(AuthException error) {
    final String code = error.code ?? '';
    final String message = error.message.toLowerCase();

    log(
      'Registration AuthException code=$code message=${error.message}',
      name: 'AuthRemoteDataSource',
    );

    final TransportErrorKind transportKind = classifyTransportFailureText(error.message);
    if (transportKind == TransportErrorKind.network) {
      return const RegistrationNetworkFailure();
    }
    if (transportKind == TransportErrorKind.server) {
      return const RegistrationBackendFailure();
    }

    if (code == 'weak_password' || message.contains('weak') && message.contains('password')) {
      return const WeakPasswordFailure();
    }
    if (code == 'email_exists' ||
        code == 'user_already_exists' ||
        message.contains('already registered') ||
        message.contains('already been registered') ||
        message.contains('user already exists')) {
      return const EmailAlreadyUsedFailure();
    }
    if (code == 'over_email_send_rate_limit' || message.contains('rate limit')) {
      return const EmailRateLimitFailure();
    }
    return RegistrationGenericFailure(message: '${error.code}: ${error.message}');
  }

  RegistrationFailure _mapRegistrationPostgrestFailure(PostgrestException error) {
    final TransportErrorKind transportKind = classifyTransportFailureText(
      '${error.code} ${error.message} ${error.details}',
    );
    return switch (transportKind) {
      TransportErrorKind.network => const RegistrationNetworkFailure(),
      TransportErrorKind.server => const RegistrationBackendFailure(),
      TransportErrorKind.other => RegistrationGenericFailure(
        message: '${error.code}: ${error.message}',
      ),
    };
  }

  Never _mapOrRethrowRegistrationTransportFailure(Object error, StackTrace stackTrace) {
    switch (classifyTransportError(error)) {
      case TransportErrorKind.network:
        throw const RegistrationNetworkFailure();
      case TransportErrorKind.server:
        throw const RegistrationBackendFailure();
      case TransportErrorKind.other:
        Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
