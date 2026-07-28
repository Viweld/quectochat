import 'package:auth/domain/entities/login_failure.dart';
import 'package:auth/domain/repositories/auth_repository.dart';
import 'package:auth/domain/utils/form_fields/form_fields.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';

part 'login_bloc.freezed.dart';
part 'login_effect.dart';
part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;
  final BlocErrorHandler _blocErrorHandler;

  LoginBloc(this._authRepository, this._blocErrorHandler) : super(_initialState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginEmailFieldUnfocused>(_onEmailFieldUnfocused);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginPasswordFieldUnfocused>(_onPasswordFieldUnfocused);
    on<LoginSubmitRequested>(_onSubmitRequested, transformer: droppable());
    on<LoginRegistrationRequested>(_onRegistrationRequested);
    on<LoginEffectHandled>(_onEffectHandled);
  }

  static LoginState _initialState() =>
      const LoginState(emailField: EmailField(), passwordField: PasswordField());

  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(emailField: EmailField(value: event.value), inlineError: null));
  }

  void _onEmailFieldUnfocused(LoginEmailFieldUnfocused event, Emitter<LoginState> emit) {
    emit(state.copyWith(emailField: state.emailField.copyWithVisibleError(isErrorVisible: true)));
  }

  void _onPasswordChanged(LoginPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(passwordField: PasswordField(value: event.value), inlineError: null));
  }

  void _onPasswordFieldUnfocused(LoginPasswordFieldUnfocused event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(passwordField: state.passwordField.copyWithVisibleError(isErrorVisible: true)),
    );
  }

  Future<void> _onSubmitRequested(LoginSubmitRequested event, Emitter<LoginState> emit) async {
    if (state.isLoading) return;

    final EmailField email = state.emailField;
    final PasswordField password = state.passwordField;
    if (email.invalid || password.invalid) {
      emit(
        state.copyWith(
          emailField: email.copyWithVisibleError(isErrorVisible: email.invalid),
          passwordField: password.copyWithVisibleError(isErrorVisible: password.invalid),
        ),
      );
      return;
    }

    emit(state.copyWith(isLoading: true, inlineError: null, effect: null));

    try {
      final Outcome<void, LoginFailure> outcome = await _authRepository.logIn(
        email: state.emailField.value,
        password: state.passwordField.value,
      );

      switch (outcome) {
        case Success<void, LoginFailure>():
          break;
        case Failure<void, LoginFailure>(:final LoginFailure error):
          emit(state.copyWith(effect: LoginEffect.showError(_mapLoginFailure(error))));
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

  void _onRegistrationRequested(LoginRegistrationRequested event, Emitter<LoginState> emit) {
    emit(state.copyWith(effect: const LoginEffect.navigateRegistration()));
  }

  void _onEffectHandled(LoginEffectHandled event, Emitter<LoginState> emit) {
    emit(state.copyWith(effect: null));
  }

  AppErrorKind _mapLoginFailure(LoginFailure failure) => switch (failure) {
    InvalidCredentialFailure() => AppErrorKind.invalidCredential,
    UserNotFoundFailure() => AppErrorKind.userNotFound,
    WrongPasswordFailure() => AppErrorKind.wrongPassword,
  };
}
