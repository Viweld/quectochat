part of 'invite_code_bloc.dart';

@freezed
sealed class InviteCodeEffect with _$InviteCodeEffect {
  const factory InviteCodeEffect.navigateQrScanner() = InviteCodeNavigateQrScannerEffect;

  const factory InviteCodeEffect.navigateRegistration({required String inviteCode}) =
      InviteCodeNavigateRegistrationEffect;
}
