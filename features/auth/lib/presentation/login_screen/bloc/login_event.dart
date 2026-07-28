part of 'login_bloc.dart';

@freezed
sealed class LoginEvent with _$LoginEvent {
  const factory LoginEvent.emailChanged(String value) = LoginEmailChanged;

  const factory LoginEvent.emailFieldUnfocused() = LoginEmailFieldUnfocused;

  const factory LoginEvent.passwordChanged(String value) = LoginPasswordChanged;

  const factory LoginEvent.passwordFieldUnfocused() = LoginPasswordFieldUnfocused;

  const factory LoginEvent.submitRequested() = LoginSubmitRequested;

  const factory LoginEvent.registrationRequested() = LoginRegistrationRequested;

  const factory LoginEvent.effectHandled() = LoginEffectHandled;
}
