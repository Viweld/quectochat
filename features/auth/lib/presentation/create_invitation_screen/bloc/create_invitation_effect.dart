part of 'create_invitation_bloc.dart';

@freezed
sealed class CreateInvitationEffect with _$CreateInvitationEffect {
  const factory CreateInvitationEffect.showError(AppErrorKind kind) =
      CreateInvitationShowErrorEffect;
}
