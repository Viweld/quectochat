part of 'reading_view_bloc.dart';

@freezed
class ReadingViewEvent with _$ReadingViewEvent {
  /// ВНУТРЕННЕЕ событие "запрос на инициализацию"
  const factory ReadingViewEvent.onInitializationRequested() =
      _EventOnInitializationRequested;

  /// ВНУТРЕННЕЕ событие "обновилось состояние"
  const factory ReadingViewEvent.onStateChanged() = _EventOnStateChanged;
}
