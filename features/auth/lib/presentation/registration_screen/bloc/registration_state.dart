part of 'registration_bloc.dart';

@freezed
abstract class RegistrationState with _$RegistrationState {
  const factory RegistrationState({
    required String inviteCode,
    required RequiredField displayNameField,
    required EmailField emailField,
    required PasswordField passwordField,
    required ConfirmPasswordField confirmPasswordField,
    @Default(false) bool isLoading,
    RegistrationEffect? effect,
  }) = _RegistrationState;
}
