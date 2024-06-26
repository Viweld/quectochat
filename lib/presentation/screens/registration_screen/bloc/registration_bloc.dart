import 'package:dep_gen/dep_gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quectochat/domain/models/network_exceptions.dart';

import '../../../../domain/interfaces/i_auth_repository.dart';
import '../../../../domain/utils/form_fields/form_fields.dart';

part 'registration_bloc.freezed.dart';

part 'events.dart';

part 'states.dart';

// ОШИБКИ ВЫПОЛНЕНИЯ:
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
enum RegistrationError {
  /// Введен слабый пароль при регистрации
  weakPassword,

  /// Введенный при регистрации email уже занят
  emailAlreadyUsed,
}

// БЛОК:
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
@DepGen()
class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc({
    @DepArg() required IAuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(_initializeViewState()) {
    on<RegistrationEvent>(
      (event, emitter) => event.map(
        onLoginChanged: (e) => _onLoginChanged(e, emitter),
        onLoginFieldUnfocused: (e) => _onLoginFieldUnfocused(e, emitter),
        onPasswordChanged: (e) => _onPasswordChanged(e, emitter),
        onPasswordFieldUnfocused: (e) => _onPasswordFieldUnfocused(e, emitter),
        onConfirmPasswordChanged: (e) => _onConfirmPasswordChanged(e, emitter),
        onConfirmPasswordFieldUnfocused: (e) =>
            _onConfirmPasswordFieldUnfocused(e, emitter),
        onLoginTapped: (_) => _onLoginTapped(emitter),
      ),
    );

    _viewState = super.state as _StateView;
  }

  // ЗАВИСИМОСТИ
  // ---------------------------------------------------------------------------
  final IAuthRepository _authRepository;

  // СОСТОЯНИЕ
  // ---------------------------------------------------------------------------
  late _StateView _viewState;

  static _StateView _initializeViewState() => const _StateView(
        emailField: EmailField(),
        passwordField: PasswordField(),
        confirmPasswordField: ConfirmPasswordField(),
      );

  // МЕТОДЫ ОБРАБОТКИ СОБЫТИЙ:
  // ---------------------------------------------------------------------------
  /// бработчик ВНЕШНЕГО события "изменился тест в поле логина"
  Future<void> _onLoginChanged(
    _EventOnLoginChanged event,
    Emitter<RegistrationState> emitter,
  ) async {
    _viewState = _viewState.copyWith(emailField: EmailField(value: event.val));
    emitter(_viewState);
  }

  /// бработчик ВНЕШНЕГО события "поле ввода логина потеряло фокус"
  Future<void> _onLoginFieldUnfocused(
    _EventOnLoginFieldUnfocused event,
    Emitter<RegistrationState> emitter,
  ) async {
    _viewState = _viewState.copyWith(
      emailField: _viewState.emailField.copyWithVisibleError(
        isErrorVisible: true,
      ),
    );
    emitter(_viewState);
  }

  /// бработчик ВНЕШНЕГО события "изменился тест в поле ввода пароля"
  Future<void> _onPasswordChanged(
    _EventOnPasswordChanged event,
    Emitter<RegistrationState> emitter,
  ) async {
    _viewState =
        _viewState.copyWith(passwordField: PasswordField(value: event.val));
    emitter(_viewState);
  }

  /// бработчик ВНЕШНЕГО события "поле ввода пароля потеряло фокус"
  Future<void> _onPasswordFieldUnfocused(
    _EventOnPasswordFieldUnfocused event,
    Emitter<RegistrationState> emitter,
  ) async {
    _viewState = _viewState.copyWith(
      passwordField: _viewState.passwordField.copyWithVisibleError(
        isErrorVisible: true,
      ),
    );
  }

  /// бработчик ВНЕШНЕГО события "изменился тест в поле повтора пароля"
  Future<void> _onConfirmPasswordChanged(
    _EventOnConfirmPasswordChanged event,
    Emitter<RegistrationState> emitter,
  ) async {
    _viewState =
        _viewState.copyWith(passwordField: PasswordField(value: event.val));
    emitter(_viewState);
  }

  /// бработчик ВНЕШНЕГО события "поле повтора пароля потеряло фокус"
  Future<void> _onConfirmPasswordFieldUnfocused(
    _EventOnConfirmPasswordFieldUnfocused event,
    Emitter<RegistrationState> emitter,
  ) async {
    _viewState = _viewState.copyWith(
      passwordField: _viewState.passwordField.copyWithVisibleError(
        isErrorVisible: true,
      ),
    );
  }

  /// Обработчик ВНЕШНЕГО события "нажата кнопка залогиниться"
  Future<void> _onLoginTapped(
    Emitter<RegistrationState> emitter,
  ) async {
    // 1. Если уже в процессе, то прерываем:
    if (_viewState.isLoading) return;

    // 2. Проверяем валидность полей ввода:
    final email = _viewState.emailField;
    final password = _viewState.passwordField;
    if (email.invalid || password.invalid) {
      _viewState = _viewState.copyWith(
        emailField: email.copyWithVisibleError(isErrorVisible: email.invalid),
        passwordField: password.copyWithVisibleError(
          isErrorVisible: password.invalid,
        ),
      );
      emitter(_viewState);
      return;
    }

    // 3. Запускаем прелоадер:
    _viewState = _viewState.copyWith(isLoading: true);
    emitter(_viewState);

    // 4. Выполняем вход:
    try {
      await _authRepository.registration(
        email: _viewState.emailField.value,
        password: _viewState.passwordField.value,
      );
    } on NetworkException catch (e) {
      emitter(RegistrationState.requestError(
        error: switch (e) {
          RegistrationWeakPassword _ => RegistrationError.weakPassword,
          RegistrationEmailAlreadyUsed _ => RegistrationError.emailAlreadyUsed,
          _ => null,
        },
      ));
    } on Object {
      emitter(const RegistrationState.requestError());
      rethrow;
    } finally {
      // 5. Вырубаем прелоадер:
      _viewState = _viewState.copyWith(isLoading: false);
      emitter(_viewState);
    }
  }
}
