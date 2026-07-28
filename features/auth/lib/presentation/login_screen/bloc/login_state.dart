part of 'login_bloc.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    required EmailField emailField,
    required PasswordField passwordField,
    @Default(false) bool isLoading,
    AppErrorViewModel? inlineError,
    LoginEffect? effect,
  }) = _LoginState;
}
