part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  /// основное состояние вью
  const factory LoginState.view({
    required EmailField emailField,
    required PasswordField passwordField,
    @Default(false) isLoading,
  }) = _StateView;

  /// состояние ошибки для отображения тоаста
  const factory LoginState.requestError({
    required LoginError? error,
  }) = _StateRequestError;
}
