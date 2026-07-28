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
  @factoryMethod
  RegistrationBloc(this._authRepository, this._blocErrorHandler) : super(_initialState()) {
    on<RegistrationEvent>((RegistrationEvent event, Emitter<RegistrationState> emit) {
      if (event is _EventOnLoginTapped) return;
      event.map(
        onFirstNameChanged: (_EventOnFirstNameChanged event) => _onFirstNameChanged(event, emit),
        onFirstNameFieldUnfocused: (_EventOnFirstNameFieldUnfocused event) =>
            _onFirstNameFieldUnfocused(event, emit),
        onLastNameChanged: (_EventOnLastNameChanged event) => _onLastNameChanged(event, emit),
        onLastNameFieldUnfocused: (_EventOnLastNameFieldUnfocused event) =>
            _onLastNameFieldUnfocused(event, emit),
        onEmailChanged: (_EventOnEmailChanged event) => _onEmailChanged(event, emit),
        onEmailFieldUnfocused: (_EventOnEmailFieldUnfocused event) =>
            _onEmailFieldUnfocused(event, emit),
        onPasswordChanged: (_EventOnPasswordChanged event) => _onPasswordChanged(event, emit),
        onPasswordFieldUnfocused: (_EventOnPasswordFieldUnfocused event) =>
            _onPasswordFieldUnfocused(event, emit),
        onConfirmPasswordChanged: (_EventOnConfirmPasswordChanged event) =>
            _onConfirmPasswordChanged(event, emit),
        onConfirmPasswordFieldUnfocused: (_EventOnConfirmPasswordFieldUnfocused event) =>
            _onConfirmPasswordFieldUnfocused(event, emit),
        onLoginTapped: (_) {},
        effectHandled: (_) => _onEffectHandled(emit),
      );
    });
    on<_EventOnLoginTapped>(_onLoginTappedEvent, transformer: droppable());
  }

  final AuthRepository _authRepository;
  final BlocErrorHandler _blocErrorHandler;

  static RegistrationState _initialState() => const RegistrationState(
    firstNameField: RequiredField(),
    lastNameField: RequiredField(),
    emailField: EmailField(),
    passwordField: PasswordField(),
    confirmPasswordField: ConfirmPasswordField(basePassword: ''),
  );

  void _onEffectHandled(Emitter<RegistrationState> emit) {
    emit(state.copyWith(effect: null));
  }

  void _onFirstNameChanged(_EventOnFirstNameChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(firstNameField: RequiredField(value: event.val.trim())));
  }

  void _onFirstNameFieldUnfocused(
    _EventOnFirstNameFieldUnfocused event,
    Emitter<RegistrationState> emit,
  ) {
    emit(
      state.copyWith(
        firstNameField: state.firstNameField.copyWithVisibleError(isErrorVisible: true),
      ),
    );
  }

  void _onLastNameChanged(_EventOnLastNameChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(lastNameField: RequiredField(value: event.val.trim())));
  }

  void _onLastNameFieldUnfocused(
    _EventOnLastNameFieldUnfocused event,
    Emitter<RegistrationState> emit,
  ) {
    emit(
      state.copyWith(lastNameField: state.lastNameField.copyWithVisibleError(isErrorVisible: true)),
    );
  }

  void _onEmailChanged(_EventOnEmailChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(emailField: EmailField(value: event.val.trim())));
  }

  void _onEmailFieldUnfocused(_EventOnEmailFieldUnfocused event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(emailField: state.emailField.copyWithVisibleError(isErrorVisible: true)));
  }

  void _onPasswordChanged(_EventOnPasswordChanged event, Emitter<RegistrationState> emit) {
    emit(
      state.copyWith(
        passwordField: PasswordField(value: event.val.trim()),
        confirmPasswordField: state.confirmPasswordField.copyWithBasePassword(
          basePassword: event.val.trim(),
        ),
      ),
    );
  }

  void _onPasswordFieldUnfocused(
    _EventOnPasswordFieldUnfocused event,
    Emitter<RegistrationState> emit,
  ) {
    emit(
      state.copyWith(passwordField: state.passwordField.copyWithVisibleError(isErrorVisible: true)),
    );
  }

  void _onConfirmPasswordChanged(
    _EventOnConfirmPasswordChanged event,
    Emitter<RegistrationState> emit,
  ) {
    emit(
      state.copyWith(
        confirmPasswordField: ConfirmPasswordField(
          value: event.val.trim(),
          basePassword: state.passwordField.value,
        ),
      ),
    );
  }

  void _onConfirmPasswordFieldUnfocused(
    _EventOnConfirmPasswordFieldUnfocused event,
    Emitter<RegistrationState> emit,
  ) {
    emit(
      state.copyWith(
        confirmPasswordField: state.confirmPasswordField.copyWithVisibleError(isErrorVisible: true),
      ),
    );
  }

  Future<void> _onLoginTappedEvent(
    _EventOnLoginTapped event,
    Emitter<RegistrationState> emit,
  ) async {
    if (state.isLoading) return;

    final RequiredField firstName = state.firstNameField;
    final RequiredField lastName = state.lastNameField;
    final EmailField email = state.emailField;
    final PasswordField password = state.passwordField;
    final ConfirmPasswordField confirmPassword = state.confirmPasswordField;
    if (firstName.invalid ||
        lastName.invalid ||
        email.invalid ||
        password.invalid ||
        confirmPassword.invalid) {
      emit(
        state.copyWith(
          firstNameField: firstName.copyWithVisibleError(isErrorVisible: firstName.invalid),
          lastNameField: lastName.copyWithVisibleError(isErrorVisible: lastName.invalid),
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
        firstName: state.firstNameField.value,
        lastName: state.lastNameField.value,
        email: state.emailField.value,
        password: state.passwordField.value,
      );

      switch (outcome) {
        case Success():
          break;
        case Failure(:final RegistrationFailure error):
          emit(
            state.copyWith(effect: RegistrationEffect.showError(_mapRegistrationFailure(error))),
          );
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

  AppErrorKind _mapRegistrationFailure(RegistrationFailure failure) => switch (failure) {
    WeakPasswordFailure() => AppErrorKind.weakPassword,
    EmailAlreadyUsedFailure() => AppErrorKind.emailAlreadyUsed,
  };
}
