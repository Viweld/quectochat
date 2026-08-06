part of 'create_invitation_bloc.dart';

@freezed
sealed class CreateInvitationEvent with _$CreateInvitationEvent {
  const factory CreateInvitationEvent.init() = CreateInvitationInit;

  const factory CreateInvitationEvent.effectHandled() = CreateInvitationEffectHandled;
}
