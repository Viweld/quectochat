part of 'invite_code_bloc.dart';

@freezed
sealed class InviteCodeEvent with _$InviteCodeEvent {
  const factory InviteCodeEvent.codeChanged(String value) = InviteCodeCodeChanged;

  const factory InviteCodeEvent.codeFilledFromQr(String value) = InviteCodeFilledFromQr;

  const factory InviteCodeEvent.submitRequested() = InviteCodeSubmitRequested;

  const factory InviteCodeEvent.scanQrRequested() = InviteCodeScanQrRequested;

  const factory InviteCodeEvent.effectHandled() = InviteCodeEffectHandled;
}
