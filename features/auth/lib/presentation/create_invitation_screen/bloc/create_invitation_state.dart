part of 'create_invitation_bloc.dart';

@freezed
abstract class CreateInvitationState with _$CreateInvitationState {
  const factory CreateInvitationState({
    required String targetRole,
    CreatedInvitation? invitation,
    @Default(false) bool isLoading,
    CreateInvitationEffect? effect,
  }) = _CreateInvitationState;
}
