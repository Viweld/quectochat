part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  /// ожидание инициализации экрана
  const factory HomeState.pending() = _StatePending;

  /// основное состояние вью
  const factory HomeState.view({
    @Default([]) Iterable<Interlocutor> interlocutors,
    @Default(false) isLoading,
  }) = _StateView;

  /// состояние ошибки для отображения тоаста
  const factory HomeState.requestError({
    String? errorText,
  }) = _StateRequestError;
}
