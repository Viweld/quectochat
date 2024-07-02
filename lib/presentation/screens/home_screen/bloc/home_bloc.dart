import 'package:dep_gen/dep_gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/interfaces/i_auth_repository.dart';

part 'home_bloc.freezed.dart';

part 'events.dart';

part 'states.dart';

@DepGen()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    @DepArg() required IAuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const HomeState.view()) {
    on<HomeEvent>(
      (event, emitter) => event.map(
        onLogoutTapped: (e) => _onLogoutTapped(e, emitter),
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

  // МЕТОДЫ ОБРАБОТКИ СОБЫТИЙ:
  // ---------------------------------------------------------------------------
  /// Обработчик ВНЕШНЕГО события "нажата кнопка выйти"
  Future<void> _onLogoutTapped(
    _EventOnLogoutTapped event,
    Emitter<HomeState> emitter,
  ) async {
    // 1. Если уже в процессе, то прерываем:
    if (_viewState.isLoading) return;

    // 2. Запускаем прелоадер:
    _viewState = _viewState.copyWith(isLoading: true);
    emitter(_viewState);

    // 3. Выполняем вход:
    try {
      await _authRepository.logOut();
    } on Object {
      emitter(const HomeState.requestError());
      rethrow;
    } finally {
      // 4. Вырубаем прелоадер:
      _viewState = _viewState.copyWith(isLoading: false);
      emitter(_viewState);
    }
  }
}
