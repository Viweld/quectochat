part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  /// ВНЕШНЕЕ событие "нажата кнопка выйти"
  const factory HomeEvent.onLogoutTapped() = _EventOnLogoutTapped;
}
