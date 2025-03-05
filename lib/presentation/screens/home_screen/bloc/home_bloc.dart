import 'package:dep_gen/dep_gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quectochat/domain/interfaces/i_api_facade.dart';

import '../../../../domain/interfaces/i_auth_repository.dart';
import '../../../../domain/models/interlocutor.dart';

part 'home_bloc.freezed.dart';

part 'events.dart';

part 'states.dart';

@DepGen()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    @DepArg() required IAuthRepository authRepository,
    @DepArg() required INetworkFacade facade,
  })  : _authRepository = authRepository,
        _facade = facade,
        super(const HomeState.pending()) {
    on<HomeEvent>(
      (event, emitter) => event.map(
        onLogoutTapped: (e) => _onLogoutTapped(e, emitter),
        onInitializationRequested: (e) =>
            _onInitializationRequested(e, emitter),
        onSearchFieldClearTapped: (e) => _onSearchFieldClearTapped(e, emitter),
        onSearchTextChanged: (e) => _onSearchTextChanged(e, emitter),
      ),
    );

    add(const HomeEvent.onInitializationRequested());
  }

  // ЗАВИСИМОСТИ
  // ---------------------------------------------------------------------------
  final IAuthRepository _authRepository;
  final INetworkFacade _facade;

  // СОСТОЯНИЕ
  // ---------------------------------------------------------------------------
  late _StateView _viewState;

  // ПРИВАТНЫЕ ДАННЫЕ:
  // ---------------------------------------------------------------------------
  late Iterable<Interlocutor> _interlocutors;

  // МЕТОДЫ ОБРАБОТКИ СОБЫТИЙ:
  // ---------------------------------------------------------------------------
  /// Обработчик ВНУТРЕННЕГО события "запрос на инициализацию"
  Future<void> _onInitializationRequested(
    _EventOnInitializationRequested event,
    Emitter<HomeState> emitter,
  ) async {
    _interlocutors = await _facade.getInterlocutors();
    _viewState = HomeState.view(interlocutors: _interlocutors) as _StateView;
    emitter(_viewState);
  }

  /// Обработчик ВНЕШНЕГО события "нажата кнопка очистки поля поиска"
  Future<void> _onSearchFieldClearTapped(
    _EventOnSearchFieldClearTapped event,
    Emitter<HomeState> emitter,
  ) async {
    _viewState = _viewState.copyWith(interlocutors: _interlocutors);
    emitter(_viewState);
  }

  /// Обработчик ВНЕШНЕГО события "изменен текст в поле поиска"
  Future<void> _onSearchTextChanged(
    _EventOnSearchTextChanged event,
    Emitter<HomeState> emitter,
  ) async {
    final searchSample = event.val.toLowerCase();
    final filteredChatList = searchSample.isEmpty
        ? _interlocutors
        : _interlocutors.where((item) {
            return item.firstName.toLowerCase().contains(searchSample) ||
                item.lastName.toLowerCase().contains(searchSample);
          });

    _viewState = _viewState.copyWith(interlocutors: filteredChatList);
    emitter(_viewState);
  }

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
