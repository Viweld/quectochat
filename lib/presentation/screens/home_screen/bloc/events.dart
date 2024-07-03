part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  /// ВНУТРЕННЕЕ событие "запрос на инициализацию"
  const factory HomeEvent.onInitializationRequested() =
      _EventOnInitializationRequested;

  /// ВНЕШНЕЕ событие "нажата кнопка очистки поля поиска"
  const factory HomeEvent.onSearchFieldClearTapped() =
      _EventOnSearchFieldClearTapped;

  /// ВНЕШНЕЕ событие "изменен текст в поле поиска"
  const factory HomeEvent.onSearchTextChanged(
    String val,
  ) = _EventOnSearchTextChanged;

  /// ВНЕШНЕЕ событие "нажата кнопка выйти"
  const factory HomeEvent.onLogoutTapped() = _EventOnLogoutTapped;
}
