part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  /// ожидание инициализации экрана
  const factory HomeState.pending() = _StatePending;

  /// состояние ошибки инициализации
  const factory HomeState.initializationError() = _StateInitializationError;

  /// основное состояние вью
  const factory HomeState.view({
    @Default([]) Iterable<Interlocutor> interlocutors,
    @Default(true) hasNext,
    @Default(true) isFirstLoading,
    @Default(false) isLogoutLoading,
    @Default('') String searchText,
    @Default(0) int searchId,
  }) = _StateView;

  /// состояние ошибки для отображения тоаста
  const factory HomeState.requestError({
    String? errorText,
  }) = _StateRequestError;
}
