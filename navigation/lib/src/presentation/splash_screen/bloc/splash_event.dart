part of 'splash_bloc.dart';

@freezed
sealed class SplashEvent with _$SplashEvent {
  /// ВНУТРЕННЕЕ событие "проинициализировать приложение"
  const factory SplashEvent.onInitializationRequested() = _EventOnInitializationRequested;

  /// Сброс обработанного UI-эффекта
  const factory SplashEvent.effectHandled() = _EffectHandled;
}
