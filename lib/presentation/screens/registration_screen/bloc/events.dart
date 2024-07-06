part of 'registration_bloc.dart';

@freezed
class RegistrationEvent with _$RegistrationEvent {
  /// ВНЕШНЕЕ событие "изменился тест в поле Имени"
  const factory RegistrationEvent.onFirstNameChanged(
    String val,
  ) = _EventOnFirstNameChanged;

  /// ВНЕШНЕЕ событие "поле ввода Имени потеряло фокус"
  const factory RegistrationEvent.onFirstNameFieldUnfocused() =
      _EventOnFirstNameFieldUnfocused;

  /// ВНЕШНЕЕ событие "изменился тест в поле Фамилии"
  const factory RegistrationEvent.onLastNameChanged(
    String val,
  ) = _EventOnLastNameChanged;

  /// ВНЕШНЕЕ событие "поле ввода Фамилии потеряло фокус"
  const factory RegistrationEvent.onLastNameFieldUnfocused() =
      _EventOnLastNameFieldUnfocused;

  /// ВНЕШНЕЕ событие "изменился тест в поле логина"
  const factory RegistrationEvent.onEmailChanged(
    String val,
  ) = _EventOnEmailChanged;

  /// ВНЕШНЕЕ событие "поле ввода логина потеряло фокус"
  const factory RegistrationEvent.onEmailFieldUnfocused() =
      _EventOnEmailFieldUnfocused;

  /// ВНЕШНЕЕ событие "изменился тест в поле ввода пароля"
  const factory RegistrationEvent.onPasswordChanged(
    String val,
  ) = _EventOnPasswordChanged;

  /// ВНЕШНЕЕ событие "поле ввода пароля потеряло фокус"
  const factory RegistrationEvent.onPasswordFieldUnfocused() =
      _EventOnPasswordFieldUnfocused;

  /// ВНЕШНЕЕ событие "изменился тест в поле повтора пароля"
  const factory RegistrationEvent.onConfirmPasswordChanged(
    String val,
  ) = _EventOnConfirmPasswordChanged;

  /// ВНЕШНЕЕ событие "поле повтора пароля потеряло фокус"
  const factory RegistrationEvent.onConfirmPasswordFieldUnfocused() =
      _EventOnConfirmPasswordFieldUnfocused;

  /// ВНЕШНЕЕ событие "нажата кнопка залогиниться"
  const factory RegistrationEvent.onLoginTapped() = _EventOnLoginTapped;
}
