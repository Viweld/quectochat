import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quectochat/domain/models/network_exceptions.dart';

import '../../../../domain/interfaces/i_auth_repository.dart';
import '../../../../domain/utils/form_fields/form_fields.dart';

part 'login_bloc.freezed.dart';

part 'events.dart';

part 'states.dart';

// ОШИБКИ ВЫПОЛНЕНИЯ:
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
enum LoginError {
  /// Невалидные логин или пароль
  invalidCredential,

  /// Пользователь не найден при попытке логина
  userNotFound,

  /// Неправильный пароль при попытке логина
  wrongPassword,
}

// БЛОК:
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @factoryMethod
  LoginBloc({
    required IAuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(_initializeViewState()) {
    on<LoginEvent>(
      (event, emitter) => event.map(
        onLoginChanged: (e) => _onLoginChanged(e, emitter),
        onLoginFieldUnfocused: (e) => _onLoginFieldUnfocused(e, emitter),
        onPasswordChanged: (e) => _onPasswordChanged(e, emitter),
        onPasswordFieldUnfocused: (e) => _onPasswordFieldUnfocused(e, emitter),
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
      );

  // МЕТОДЫ ОБРАБОТКИ СОБЫТИЙ:
  // ---------------------------------------------------------------------------
  /// бработчик ВНЕШНЕГО события "изменился тест в поле логина"
  Future<void> _onLoginChanged(
    _EventOnLoginChanged event,
    Emitter<LoginState> emitter,
  ) async {
    _viewState = _viewState.copyWith(emailField: EmailField(value: event.val));
    emitter(_viewState);
  }

  /// бработчик ВНЕШНЕГО события "поле ввода логина потеряло фокус"
  Future<void> _onLoginFieldUnfocused(
    _EventOnLoginFieldUnfocused event,
    Emitter<LoginState> emitter,
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
    Emitter<LoginState> emitter,
  ) async {
    _viewState =
        _viewState.copyWith(passwordField: PasswordField(value: event.val));
    emitter(_viewState);
  }

  /// бработчик ВНЕШНЕГО события "поле ввода пароля потеряло фокус"
  Future<void> _onPasswordFieldUnfocused(
    _EventOnPasswordFieldUnfocused event,
    Emitter<LoginState> emitter,
  ) async {
    _viewState = _viewState.copyWith(
      passwordField: _viewState.passwordField.copyWithVisibleError(
        isErrorVisible: true,
      ),
    );
    emitter(_viewState);
  }

  /// Обработчик ВНЕШНЕГО события "нажата кнопка залогиниться"
  Future<void> _onLoginTapped(
    Emitter<LoginState> emitter,
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
      await _authRepository.logIn(
        email: _viewState.emailField.value,
        password: _viewState.passwordField.value,
      );
    } on NetworkException catch (e) {
      emitter(LoginState.requestError(
        error: switch (e) {
          LoginInvalidCredential _ => LoginError.invalidCredential,
          LoginUserNotFound _ => LoginError.userNotFound,
          LoginUserWrongPassword _ => LoginError.wrongPassword,
          _ => null,
        },
      ));
    } on Object {
      emitter(const LoginState.requestError());
      rethrow;
    } finally {
      // 5. Вырубаем прелоадер:
      _viewState = _viewState.copyWith(isLoading: false);
      emitter(_viewState);
    }
  }
}
