part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  /// ВНЕШНЕЕ событие "нажата кнопка залогиниться"
  const factory LoginEvent.onLoginTapped() = _EventOnLoginTapped;
}
