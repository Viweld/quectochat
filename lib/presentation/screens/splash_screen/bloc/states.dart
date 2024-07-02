part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  /// не проинициализировано
  const factory SplashState.notInitialized() = _StateNotInitialized;

  /// инициализация завершена
  const factory SplashState.initializationCompleted() =
      _StateInitializationCompleted;
}
