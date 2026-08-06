part of 'login_bloc.dart';

@freezed
sealed class LoginEffect with _$LoginEffect {
  const factory LoginEffect.showError(AppErrorKind kind) = LoginShowErrorEffect;

  const factory LoginEffect.navigateInviteCode() = LoginNavigateInviteCodeEffect;
}
