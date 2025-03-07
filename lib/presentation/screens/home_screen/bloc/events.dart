part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  /// ВНУТРЕННЕЕ событие "запрос на инициализацию"
  const factory HomeEvent.onInitializationRequested() =
      _EventOnInitializationRequested;

  /// ВНУТРЕННЕЕ событие "запрошена загрузка данных"
  const factory HomeEvent.onFetchRequested() = _EventOnFetchRequested;

  /// ВНЕШНЕЕ событие "нажата кнопка очистки поля поиска"
  const factory HomeEvent.onSearchFieldClearTapped() =
      _EventOnSearchFieldClearTapped;

  /// ВНЕШНЕЕ событие "запрошена следующая страница"
  const factory HomeEvent.onNextPageRequested() = _EventOnNextPageRequested;

  /// ВНЕШНЕЕ событие "изменен текст в поле поиска"
  const factory HomeEvent.onSearchTextChanged(
    String val,
  ) = _EventOnSearchTextChanged;

  /// ВНЕШНЕЕ событие "нажата кнопка выйти"
  const factory HomeEvent.onLogoutTapped() = _EventOnLogoutTapped;

  /// ВНЕШНЕЕ событие "запрошена очистка чата с собеседником с id"
  const factory HomeEvent.onClearChatRequested({
    required String interlocutorId,
  }) = _EventOnClearChatRequested;

  /// ВНУТРЕННЕЕ событие "состояние экрана изменилось"
  const factory HomeEvent.onStateChanged() = _EventOnStateChanged;
}
