part of 'registration_bloc.dart';

@freezed
sealed class RegistrationEvent with _$RegistrationEvent {
  const factory RegistrationEvent.displayNameChanged(String value) = RegistrationDisplayNameChanged;

  const factory RegistrationEvent.displayNameFieldUnfocused() =
      RegistrationDisplayNameFieldUnfocused;

  const factory RegistrationEvent.emailChanged(String value) = RegistrationEmailChanged;

  const factory RegistrationEvent.emailFieldUnfocused() = RegistrationEmailFieldUnfocused;

  const factory RegistrationEvent.passwordChanged(String value) = RegistrationPasswordChanged;

  const factory RegistrationEvent.passwordFieldUnfocused() = RegistrationPasswordFieldUnfocused;

  const factory RegistrationEvent.confirmPasswordChanged(String value) =
      RegistrationConfirmPasswordChanged;

  const factory RegistrationEvent.confirmPasswordFieldUnfocused() =
      RegistrationConfirmPasswordFieldUnfocused;

  const factory RegistrationEvent.submitRequested() = RegistrationSubmitRequested;

  const factory RegistrationEvent.effectHandled() = RegistrationEffectHandled;
}
