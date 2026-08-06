import 'package:auth/domain/entities/created_invitation.dart';
import 'package:auth/domain/entities/invitation_failure.dart';
import 'package:auth/domain/entities/invite_target_role.dart';
import 'package:auth/domain/repositories/auth_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';

part 'create_invitation_bloc.freezed.dart';
part 'create_invitation_effect.dart';
part 'create_invitation_event.dart';
part 'create_invitation_state.dart';

@injectable
class CreateInvitationBloc extends Bloc<CreateInvitationEvent, CreateInvitationState> {
  final AuthRepository _authRepository;
  final BlocErrorHandler _blocErrorHandler;

  @factoryMethod
  CreateInvitationBloc(
    this._authRepository,
    this._blocErrorHandler, {
    @factoryParam required String targetRole,
  }) : super(_initialState(targetRole: targetRole)) {
    on<CreateInvitationInit>(_onInit, transformer: droppable());
    on<CreateInvitationEffectHandled>(_onEffectHandled);
    add(const CreateInvitationEvent.init());
  }

  static CreateInvitationState _initialState({required String targetRole}) =>
      CreateInvitationState(targetRole: targetRole);

  void _onEffectHandled(CreateInvitationEffectHandled event, Emitter<CreateInvitationState> emit) {
    emit(state.copyWith(effect: null));
  }

  Future<void> _onInit(CreateInvitationInit event, Emitter<CreateInvitationState> emit) async {
    if (state.isLoading) return;

    final InviteTargetRole? role = parseInviteTargetRole(state.targetRole);
    if (role == null) {
      emit(
        state.copyWith(effect: const CreateInvitationEffect.showError(AppErrorKind.invalidInvite)),
      );
      return;
    }

    emit(state.copyWith(isLoading: true, invitation: null, effect: null));

    try {
      final Outcome<CreatedInvitation, InvitationFailure> outcome = await _authRepository
          .createInvitation(targetRole: role);

      switch (outcome) {
        case Success<CreatedInvitation, InvitationFailure>(:final CreatedInvitation value):
          emit(state.copyWith(invitation: value));
        case Failure<CreatedInvitation, InvitationFailure>(:final InvitationFailure error):
          emit(state.copyWith(effect: CreateInvitationEffect.showError(_mapFailure(error))));
      }
    } on Object catch (error, stackTrace) {
      final ErrorPresentation presentation = _blocErrorHandler.handle(
        error,
        stackTrace: stackTrace,
      );
      if (presentation.shouldRethrow) rethrow;
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  AppErrorKind _mapFailure(InvitationFailure failure) => switch (failure) {
    InvitationNetworkFailure() => AppErrorKind.network,
    InvitationBackendFailure() || InvitationGenericFailure() => AppErrorKind.server,
    InvitationExpiredFailure() => AppErrorKind.inviteExpired,
    InvitationUsedFailure() => AppErrorKind.inviteUsed,
    InvitationInvalidFormatFailure() => AppErrorKind.invalidInvite,
    InvitationNotFoundFailure() || InvitationRevokedFailure() => AppErrorKind.inviteNotFound,
  };
}
