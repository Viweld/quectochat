part of 'reading_view_bloc.dart';

@freezed
sealed class ReadingViewEvent with _$ReadingViewEvent {
  /// ВНУТРЕННЕЕ событие "запрошена следующая страница"
  const factory ReadingViewEvent.onNextPageRequested() = _EventOnNextPageRequested;

  /// ВНУТРЕННЕЕ событие "обновился список сообщений"
  const factory ReadingViewEvent.onMessagesUpdated({required Iterable<Message> messages}) =
      _EventOnMessagesUpdated;

  /// Сброс обработанного UI-эффекта
  const factory ReadingViewEvent.effectHandled() = _EffectHandled;
}
