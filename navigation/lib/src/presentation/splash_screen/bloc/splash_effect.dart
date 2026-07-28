part of 'splash_bloc.dart';

@freezed
sealed class SplashEffect with _$SplashEffect {
  const factory SplashEffect.navigateLogin() = _NavigateLogin;

  const factory SplashEffect.navigateHome() = _NavigateHome;
}
