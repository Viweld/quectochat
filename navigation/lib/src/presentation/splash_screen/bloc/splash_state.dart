part of 'splash_bloc.dart';

@freezed
abstract class SplashState with _$SplashState {
  const factory SplashState({@Default(true) bool isInitializing, SplashEffect? effect}) =
      _SplashState;
}
