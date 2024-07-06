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
        onFirstNameChanged: (e) => _onFirstNameChanged(e, emitter),
        onFirstNameFieldUnfocused: (e) =>
            _onFirstNameFieldUnfocused(e, emitter),
        onLastNameChanged: (e) => _onLastNameChanged(e, emitter),
        onLastNameFieldUnfocused: (e) => _onLastNameFieldUnfocused(e, emitter),
        onEmailChanged: (e) => _onEmailChanged(e, emitter),
        onEmailFieldUnfocused: (e) => _onEmailFieldUnfocused(e, emitter),
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
        firstNameField: RequiredField(),
        lastNameField: RequiredField(),
        emailField: EmailField(),
        passwordField: PasswordField(),
        confirmPasswordField: ConfirmPasswordField(basePassword: ''),
      );

  // МЕТОДЫ ОБРАБОТКИ СОБЫТИЙ:
  // ---------------------------------------------------------------------------
  /// Обработчик ВНЕШНЕГО события "bзменился тест в поле Имени"
  Future<void> _onFirstNameChanged(
    _EventOnFirstNameChanged event,
    Emitter<RegistrationState> emitter,
  ) async {
    _viewState = _viewState.copyWith(
      firstNameField: RequiredField(value: event.val),
    );
    emitter(_viewState);
  }

  /// Обработчик ВНЕШНЕГО события "поле ввода Имени потеряло фокус"
  Future<void> _onFirstNameFieldUnfocused(
    _EventOnFirstNameFieldUnfocused event,
    Emitter<RegistrationState> emitter,
  ) async {
    _viewState = _viewState.copyWith(
      firstNameField: _viewState.firstNameField.copyWithVisibleError(
        isErrorVisible: true,
      ),
    );
    emitter(_viewState);
  }

  /// Обработчик ВНЕШНЕГО события "изменился тест в поле Фамилии"
  Future<void> _onLastNameChanged(
    _EventOnLastNameChanged event,
    Emitter<RegistrationState> emitter,
  ) async {
    _viewState = _viewState.copyWith(
      lastNameField: RequiredField(value: event.val),
    );
    emitter(_viewState);
  }

  /// Обработчик ВНЕШНЕГО события "поле ввода Фамилии потеряло фокус"
  Future<void> _onLastNameFieldUnfocused(
    _EventOnLastNameFieldUnfocused event,
    Emitter<RegistrationState> emitter,
  ) async {
    _viewState = _viewState.copyWith(
      lastNameField: _viewState.lastNameField.copyWithVisibleError(
        isErrorVisible: true,
      ),
    );
    emitter(_viewState);
  }

  /// Обработчик ВНЕШНЕГО события "изменился тест в поле Email"
  Future<void> _onEmailChanged(
    _EventOnEmailChanged event,
    Emitter<RegistrationState> emitter,
  ) async {
    _viewState = _viewState.copyWith(emailField: EmailField(value: event.val));
    emitter(_viewState);
  }

  /// Обработчик ВНЕШНЕГО события "поле ввода Email потеряло фокус"
  Future<void> _onEmailFieldUnfocused(
    _EventOnEmailFieldUnfocused event,
    Emitter<RegistrationState> emitter,
  ) async {
    _viewState = _viewState.copyWith(
      emailField: _viewState.emailField.copyWithVisibleError(
        isErrorVisible: true,
      ),
    );
    emitter(_viewState);
  }

  /// Обработчик ВНЕШНЕГО события "изменился тест в поле ввода пароля"
  Future<void> _onPasswordChanged(
    _EventOnPasswordChanged event,
    Emitter<RegistrationState> emitter,
  ) async {
    _viewState = _viewState.copyWith(
      passwordField: PasswordField(value: event.val),
      confirmPasswordField: _viewState.confirmPasswordField
          .copyWithBasePassword(basePassword: event.val),
    );
    emitter(_viewState);
  }

  /// Обработчик ВНЕШНЕГО события "поле ввода пароля потеряло фокус"
  Future<void> _onPasswordFieldUnfocused(
    _EventOnPasswordFieldUnfocused event,
    Emitter<RegistrationState> emitter,
  ) async {
    _viewState = _viewState.copyWith(
      passwordField: _viewState.passwordField.copyWithVisibleError(
        isErrorVisible: true,
      ),
    );
    emitter(_viewState);
  }

  /// Обработчик ВНЕШНЕГО события "изменился тест в поле повтора пароля"
  Future<void> _onConfirmPasswordChanged(
    _EventOnConfirmPasswordChanged event,
    Emitter<RegistrationState> emitter,
  ) async {
    _viewState = _viewState.copyWith(
      confirmPasswordField: ConfirmPasswordField(
        value: event.val,
        basePassword: _viewState.passwordField.value,
      ),
    );
    emitter(_viewState);
  }

  /// Обработчик ВНЕШНЕГО события "поле повтора пароля потеряло фокус"
  Future<void> _onConfirmPasswordFieldUnfocused(
    _EventOnConfirmPasswordFieldUnfocused event,
    Emitter<RegistrationState> emitter,
  ) async {
    _viewState = _viewState.copyWith(
      confirmPasswordField: _viewState.confirmPasswordField
          .copyWithVisibleError(isErrorVisible: true),
    );
    emitter(_viewState);
  }

  /// Обработчик ВНЕШНЕГО события "нажата кнопка залогиниться"
  Future<void> _onLoginTapped(
    Emitter<RegistrationState> emitter,
  ) async {
    // 1. Если уже в процессе, то прерываем:
    if (_viewState.isLoading) return;

    // 2. Проверяем валидность полей ввода:
    final firstName = _viewState.firstNameField;
    final lastName = _viewState.lastNameField;
    final email = _viewState.emailField;
    final password = _viewState.passwordField;
    final confirmPassword = _viewState.confirmPasswordField;
    if (email.invalid ||
        password.invalid ||
        confirmPassword.invalid ||
        firstName.invalid ||
        lastName.invalid) {
      _viewState = _viewState.copyWith(
        firstNameField:
            firstName.copyWithVisibleError(isErrorVisible: email.invalid),
        lastNameField:
            lastName.copyWithVisibleError(isErrorVisible: email.invalid),
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

    // 4. Выполняем регистрацию:
    try {
      await _authRepository.registration(
        firstName: _viewState.firstNameField.value,
        lastName: _viewState.lastNameField.value,
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
