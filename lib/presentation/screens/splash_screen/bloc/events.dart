part of 'splash_bloc.dart';

@freezed
class SplashEvent with _$SplashEvent {
  /// ВНУТРЕННЕЕ событие "проинициализировать приложение"
  const factory SplashEvent.onInitializationRequested() =
      _EventOnInitializationRequested;
}
