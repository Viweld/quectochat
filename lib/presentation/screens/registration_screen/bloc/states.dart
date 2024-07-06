part of 'registration_bloc.dart';

@freezed
class RegistrationState with _$RegistrationState {
  /// основное состояние вью
  const factory RegistrationState.view({
    required RequiredField firstNameField,
    required RequiredField lastNameField,
    required EmailField emailField,
    required PasswordField passwordField,
    required ConfirmPasswordField confirmPasswordField,
    @Default(false) isLoading,
  }) = _StateView;

  /// состояние ошибки для отображения тоаста
  const factory RegistrationState.requestError({
    RegistrationError? error,
  }) = _StateRequestError;
}
