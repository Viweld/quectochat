part of 'reading_view_bloc.dart';

@freezed
class ReadingViewState with _$ReadingViewState {
  /// ожидание инициализации экрана
  const factory ReadingViewState.pending() = _StatePending;

  /// основное состояние вью
  const factory ReadingViewState.view({
    @Default([]) Iterable<ChatMessage> messages,
  }) = _StateView;

  /// состояние ошибки инициализации
  const factory ReadingViewState.initializationError() =
      _StateInitializationError;
}
