part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  /// основное состояние вью
  const factory HomeState.view({
    @Default(false) isLoading,
  }) = _StateView;

  /// состояние ошибки для отображения тоаста
  const factory HomeState.requestError({
    String? errorText,
  }) = _StateRequestError;
}
