import 'package:auth/domain/entities/registration_failure.dart';
import 'package:auth/domain/repositories/auth_repository.dart';
import 'package:auth/domain/utils/form_fields/form_fields.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';

part 'registration_bloc.freezed.dart';
part 'registration_effect.dart';
part 'registration_event.dart';
part 'registration_state.dart';

@injectable
class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final AuthRepository _authRepository;
  final BlocErrorHandler _blocErrorHandler;

  @factoryMethod
  RegistrationBloc(
    this._authRepository,
    this._blocErrorHandler, {
    @factoryParam required String inviteCode,
  }) : super(_initialState(inviteCode: inviteCode)) {
    on<RegistrationDisplayNameChanged>(_onDisplayNameChanged);
    on<RegistrationDisplayNameFieldUnfocused>(_onDisplayNameFieldUnfocused);
    on<RegistrationEmailChanged>(_onEmailChanged);
    on<RegistrationEmailFieldUnfocused>(_onEmailFieldUnfocused);
    on<RegistrationPasswordChanged>(_onPasswordChanged);
    on<RegistrationPasswordFieldUnfocused>(_onPasswordFieldUnfocused);
    on<RegistrationConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<RegistrationConfirmPasswordFieldUnfocused>(_onConfirmPasswordFieldUnfocused);
    on<RegistrationSubmitRequested>(_onSubmitRequested, transformer: droppable());
    on<RegistrationEffectHandled>(_onEffectHandled);
  }

  static RegistrationState _initialState({required String inviteCode}) => RegistrationState(
    inviteCode: inviteCode,
    displayNameField: const RequiredField(),
    emailField: const EmailField(),
    passwordField: const PasswordField(),
    confirmPasswordField: const ConfirmPasswordField(basePassword: ''),
  );

  void _onEffectHandled(RegistrationEffectHandled event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(effect: null));
  }

  void _onDisplayNameChanged(
    RegistrationDisplayNameChanged event,
    Emitter<RegistrationState> emit,
  ) {
    emit(state.copyWith(displayNameField: RequiredField(value: event.value.trim())));
  }

  void _onDisplayNameFieldUnfocused(
    RegistrationDisplayNameFieldUnfocused event,
    Emitter<RegistrationState> emit,
  ) {
    emit(
      state.copyWith(
        displayNameField: state.displayNameField.copyWithVisibleError(isErrorVisible: true),
      ),
    );
  }

  void _onEmailChanged(RegistrationEmailChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(emailField: EmailField(value: event.value.trim())));
  }

  void _onEmailFieldUnfocused(
    RegistrationEmailFieldUnfocused event,
    Emitter<RegistrationState> emit,
  ) {
    emit(state.copyWith(emailField: state.emailField.copyWithVisibleError(isErrorVisible: true)));
  }

  void _onPasswordChanged(RegistrationPasswordChanged event, Emitter<RegistrationState> emit) {
    emit(
      state.copyWith(
        passwordField: PasswordField(value: event.value.trim()),
        confirmPasswordField: state.confirmPasswordField.copyWithBasePassword(
          basePassword: event.value.trim(),
        ),
      ),
    );
  }

  void _onPasswordFieldUnfocused(
    RegistrationPasswordFieldUnfocused event,
    Emitter<RegistrationState> emit,
  ) {
    emit(
      state.copyWith(passwordField: state.passwordField.copyWithVisibleError(isErrorVisible: true)),
    );
  }

  void _onConfirmPasswordChanged(
    RegistrationConfirmPasswordChanged event,
    Emitter<RegistrationState> emit,
  ) {
    emit(
      state.copyWith(
        confirmPasswordField: ConfirmPasswordField(
          value: event.value.trim(),
          basePassword: state.passwordField.value,
        ),
      ),
    );
  }

  void _onConfirmPasswordFieldUnfocused(
    RegistrationConfirmPasswordFieldUnfocused event,
    Emitter<RegistrationState> emit,
  ) {
    emit(
      state.copyWith(
        confirmPasswordField: state.confirmPasswordField.copyWithVisibleError(isErrorVisible: true),
      ),
    );
  }

  Future<void> _onSubmitRequested(
    RegistrationSubmitRequested event,
    Emitter<RegistrationState> emit,
  ) async {
    if (state.isLoading) return;

    final RequiredField displayName = state.displayNameField;
    final EmailField email = state.emailField;
    final PasswordField password = state.passwordField;
    final ConfirmPasswordField confirmPassword = state.confirmPasswordField;
    if (displayName.invalid || email.invalid || password.invalid || confirmPassword.invalid) {
      emit(
        state.copyWith(
          displayNameField: displayName.copyWithVisibleError(isErrorVisible: displayName.invalid),
          emailField: email.copyWithVisibleError(isErrorVisible: email.invalid),
          passwordField: password.copyWithVisibleError(isErrorVisible: password.invalid),
          confirmPasswordField: confirmPassword.copyWithVisibleError(
            isErrorVisible: confirmPassword.invalid,
          ),
        ),
      );
      return;
    }

    emit(state.copyWith(isLoading: true, effect: null));

    try {
      final Outcome<void, RegistrationFailure> outcome = await _authRepository.registration(
        displayName: state.displayNameField.value,
        email: state.emailField.value,
        password: state.passwordField.value,
        inviteCode: state.inviteCode,
      );

      switch (outcome) {
        case Success<void, RegistrationFailure>():
          break;
        case Failure<void, RegistrationFailure>(:final RegistrationFailure error):
          emit(state.copyWith(effect: _mapRegistrationFailureToEffect(error)));
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

  RegistrationEffect _mapRegistrationFailureToEffect(RegistrationFailure failure) {
    return switch (failure) {
      WeakPasswordFailure() => const RegistrationEffect.showError(AppErrorKind.weakPassword),
      EmailAlreadyUsedFailure() => const RegistrationEffect.showError(
        AppErrorKind.emailAlreadyUsed,
      ),
      EmailRateLimitFailure() => const RegistrationEffect.showError(AppErrorKind.emailRateLimit),
      InvalidInviteFailure() => const RegistrationEffect.showError(AppErrorKind.invalidInvite),
      RegistrationNetworkFailure() => const RegistrationEffect.showError(AppErrorKind.network),
      RegistrationBackendFailure() => const RegistrationEffect.showError(AppErrorKind.server),
      RegistrationGenericFailure() => const RegistrationEffect.showError(AppErrorKind.generic),
    };
  }
}
