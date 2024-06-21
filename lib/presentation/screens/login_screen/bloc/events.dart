part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  /// ВНЕШНЕЕ событие "изменился тест в поле логина"
  const factory LoginEvent.onLoginChanged(
    String val,
  ) = _EventOnLoginChanged;

  /// ВНЕШНЕЕ событие "поле ввода логина потеряло фокус"
  const factory LoginEvent.onLoginFieldUnfocused() =
      _EventOnLoginFieldUnfocused;

  /// ВНЕШНЕЕ событие "изменился тест в поле ввода пароля"
  const factory LoginEvent.onPasswordChanged(
    String val,
  ) = _EventOnPasswordChanged;

  /// ВНЕШНЕЕ событие "поле ввода пароля потеряло фокус"
  const factory LoginEvent.onPasswordFieldUnfocused() =
      _EventOnPasswordFieldUnfocused;

  /// ВНЕШНЕЕ событие "нажата кнопка залогиниться"
  const factory LoginEvent.onLoginTapped() = _EventOnLoginTapped;
}
