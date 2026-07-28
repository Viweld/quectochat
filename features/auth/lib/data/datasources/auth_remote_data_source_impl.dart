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
    } on AuthException catch (error) {
      throw _mapRegistrationFailure(error);
    }
  }

  @override
  Future<void> logOut() async {
    await _client.auth.signOut();
  }

  LoginFailure _mapLoginFailure(AuthException error) {
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

  RegistrationFailure _mapRegistrationFailure(AuthException error) {
    final String code = error.code ?? '';
    final String message = error.message.toLowerCase();

    if (code == 'weak_password' || message.contains('password')) {
      return const WeakPasswordFailure();
    }
    if (code == 'email_exists' ||
        code == 'user_already_exists' ||
        message.contains('already') ||
        message.contains('registered')) {
      return const EmailAlreadyUsedFailure();
    }
    return const EmailAlreadyUsedFailure();
  }
}
