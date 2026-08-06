import 'package:auth/domain/entities/invitation_failure.dart';
import 'package:auth/domain/entities/validated_invitation.dart';
import 'package:auth/domain/repositories/auth_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';

part 'invite_code_bloc.freezed.dart';
part 'invite_code_effect.dart';
part 'invite_code_event.dart';
part 'invite_code_state.dart';

@injectable
class InviteCodeBloc extends Bloc<InviteCodeEvent, InviteCodeState> {
  final AuthRepository _authRepository;
  final BlocErrorHandler _blocErrorHandler;

  InviteCodeBloc(this._authRepository, this._blocErrorHandler) : super(const InviteCodeState()) {
    on<InviteCodeCodeChanged>(_onCodeChanged);
    on<InviteCodeFilledFromQr>(_onCodeFilledFromQr);
    on<InviteCodeSubmitRequested>(_onSubmitRequested, transformer: droppable());
    on<InviteCodeScanQrRequested>(_onScanQrRequested);
    on<InviteCodeEffectHandled>(_onEffectHandled);
  }

  void _onCodeChanged(InviteCodeCodeChanged event, Emitter<InviteCodeState> emit) {
    emit(state.copyWith(code: _normalizeCode(event.value), inlineError: null));
  }

  void _onCodeFilledFromQr(InviteCodeFilledFromQr event, Emitter<InviteCodeState> emit) {
    emit(state.copyWith(code: _normalizeCode(event.value), inlineError: null));
  }

  void _onScanQrRequested(InviteCodeScanQrRequested event, Emitter<InviteCodeState> emit) {
    emit(state.copyWith(effect: const InviteCodeEffect.navigateQrScanner()));
  }

  void _onEffectHandled(InviteCodeEffectHandled event, Emitter<InviteCodeState> emit) {
    emit(state.copyWith(effect: null));
  }

  Future<void> _onSubmitRequested(
    InviteCodeSubmitRequested event,
    Emitter<InviteCodeState> emit,
  ) async {
    if (state.isLoading) return;
    if (!state.isCodeComplete) {
      emit(state.copyWith(inlineError: const AppErrorViewModel(kind: AppErrorKind.invalidInvite)));
      return;
    }

    emit(state.copyWith(isLoading: true, inlineError: null, effect: null));

    try {
      final Outcome<ValidatedInvitation, InvitationFailure> outcome = await _authRepository
          .validateInvitation(code: state.code);

      switch (outcome) {
        case Success<ValidatedInvitation, InvitationFailure>():
          emit(
            state.copyWith(effect: InviteCodeEffect.navigateRegistration(inviteCode: state.code)),
          );
        case Failure<ValidatedInvitation, InvitationFailure>(:final InvitationFailure error):
          emit(state.copyWith(inlineError: _mapFailure(error)));
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

  AppErrorViewModel _mapFailure(InvitationFailure failure) => switch (failure) {
    InvitationExpiredFailure() => const AppErrorViewModel(kind: AppErrorKind.inviteExpired),
    InvitationUsedFailure() => const AppErrorViewModel(kind: AppErrorKind.inviteUsed),
    InvitationInvalidFormatFailure() => const AppErrorViewModel(kind: AppErrorKind.invalidInvite),
    InvitationNotFoundFailure() ||
    InvitationRevokedFailure() => const AppErrorViewModel(kind: AppErrorKind.inviteNotFound),
    InvitationNetworkFailure() => const AppErrorViewModel(kind: AppErrorKind.network),
    InvitationBackendFailure() ||
    InvitationGenericFailure() => const AppErrorViewModel(kind: AppErrorKind.server),
  };

  static String _normalizeCode(String value) =>
      value.toUpperCase().replaceAll(RegExp('[^A-Z0-9]'), '');
}
