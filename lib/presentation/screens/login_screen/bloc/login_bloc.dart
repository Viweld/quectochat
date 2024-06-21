import 'package:dep_gen/dep_gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quectochat/domain/interfaces/i_api_facade.dart';

import '../../../../domain/utils/form_fields/form_fields.dart';

part 'login_bloc.freezed.dart';

part 'events.dart';

part 'states.dart';

// ОШИБКИ ВЫПОЛНЕНИЯ:
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
enum LoginError {
  /// Пользователь не найден при попытке логина
  userNotFound,

  /// Неправильный пароль при попытке логина
  wrongPassword,
}

// БЛОК:
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
@DepGen()
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    @DepArg() required INetworkFacade networkFacade,
  })  : _networkFacade = networkFacade,
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
  final INetworkFacade _networkFacade;

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
  }

  /// Обработчик ВНЕШНЕГО события "нажата кнопка залогиниться"
  Future<void> _onLoginTapped(
    Emitter<LoginState> emitter,
  ) async {
    // TODO(Vadim): #unimplemented
    throw UnimplementedError();
  }
}
