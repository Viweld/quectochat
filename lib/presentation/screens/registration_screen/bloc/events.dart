part of 'registration_bloc.dart';

@freezed
class RegistrationEvent with _$RegistrationEvent {
  /// ВНЕШНЕЕ событие "изменился тест в поле логина"
  const factory RegistrationEvent.onLoginChanged(
    String val,
  ) = _EventOnLoginChanged;

  /// ВНЕШНЕЕ событие "поле ввода логина потеряло фокус"
  const factory RegistrationEvent.onLoginFieldUnfocused() =
      _EventOnLoginFieldUnfocused;

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
