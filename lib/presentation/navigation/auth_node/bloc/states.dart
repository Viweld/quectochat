part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  /// состояние, когда пользователь авторизован
  const factory AuthState.authorized() = _StateAuthorized;

  /// состояние, когда пользователь не авторизован
  const factory AuthState.notAuthorized() = _StateNotAuthorized;
}
