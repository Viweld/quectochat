import 'package:dep_gen/dep_gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quectochat/domain/interfaces/i_api_facade.dart';
import 'package:quectochat/domain/interfaces/i_home_repository.dart';

import '../../../../domain/interfaces/i_auth_repository.dart';
import '../../../../domain/models/interlocutor.dart';

part 'home_bloc.freezed.dart';

part 'events.dart';

part 'states.dart';

@DepGen()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    @DepArg() required IAuthRepository authRepository,
    @DepArg() required IHomeRepository homeRepository,
  })  : _authRepository = authRepository,
        _homeRepository = homeRepository,
        super(const HomeState.pending()) {
    on<HomeEvent>(
      (event, emitter) => event.map(
        onLogoutTapped: (e) => _onLogoutTapped(e, emitter),
        onInitializationRequested: (e) =>
            _onInitializationRequested(e, emitter),
        onSearchFieldClearTapped: (e) => _onSearchFieldClearTapped(e, emitter),
        onSearchTextChanged: (e) => _onSearchTextChanged(e, emitter),
        onStateChanged: (_) => emitter(_viewState),
      ),
    );

    add(const HomeEvent.onInitializationRequested());
  }

  // ЗАВИСИМОСТИ
  // ---------------------------------------------------------------------------
  final IAuthRepository _authRepository;
  final IHomeRepository _homeRepository;

  // СОСТОЯНИЕ
  // ---------------------------------------------------------------------------
  late _StateView _viewState;

  // СТРИМЫ:
  // ---------------------------------------------------------------------------
  late InterlocutorsSubscription _interlocutorsSubscription;

  @override
  Future<void> close() async {
    await _interlocutorsSubscription.cancel();
    return super.close();
  }

  void _interlocutorsListener(Set<Interlocutor> updatedInterlocutors) {
    final interlocutors = _viewState.interlocutors.toList();

    for (final updated in updatedInterlocutors) {
      final index = interlocutors.indexWhere((i) => i.userId == updated.userId);

      // Удаляем старую версию, если она есть в списке
      if (index != -1) interlocutors.removeAt(index);

      // Используем бинарный поиск для нахождения позиции вставки
      int insertIndex = _findInsertPosition(interlocutors, updated);
      interlocutors.insert(insertIndex, updated);
    }

    _viewState = _viewState.copyWith(interlocutors: interlocutors);
    add(HomeEvent.onStateChanged());
  }

  // МЕТОДЫ ОБРАБОТКИ СОБЫТИЙ:
  // ---------------------------------------------------------------------------
  /// Обработчик ВНУТРЕННЕГО события "запрос на инициализацию"
  Future<void> _onInitializationRequested(
    _EventOnInitializationRequested event,
    Emitter<HomeState> emitter,
  ) async {
    final interlocutors = await _homeRepository.getInterlocutors();
    _viewState = HomeState.view(
      interlocutors: interlocutors.result,
    ) as _StateView;
    emitter(_viewState);

    _interlocutorsSubscription =
        _homeRepository.subscribe(_interlocutorsListener);
  }

  /// Обработчик ВНЕШНЕГО события "нажата кнопка очистки поля поиска"
  Future<void> _onSearchFieldClearTapped(
    _EventOnSearchFieldClearTapped event,
    Emitter<HomeState> emitter,
  ) async {
    // _viewState = _viewState.copyWith(interlocutors: _interlocutors);
    emitter(_viewState);
  }

  /// Обработчик ВНЕШНЕГО события "изменен текст в поле поиска"
  Future<void> _onSearchTextChanged(
    _EventOnSearchTextChanged event,
    Emitter<HomeState> emitter,
  ) async {
    // final searchSample = event.val.toLowerCase();
    // final filteredChatList = searchSample.isEmpty
    //     ? _interlocutors
    //     : _interlocutors.where((item) {
    //         return item.firstName.toLowerCase().contains(searchSample) ||
    //             item.lastName.toLowerCase().contains(searchSample);
    //       });
    //
    // _viewState = _viewState.copyWith(interlocutors: filteredChatList);
    // emitter(_viewState);
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

  // ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ:
  // ---------------------------------------------------------------------------
  /// Бинарный поиск для нахождения правильной позиции вставки
  int _findInsertPosition(List<Interlocutor> list, Interlocutor target) {
    int left = 0, right = list.length;

    while (left < right) {
      int mid = (left + right) ~/ 2;
      if (_compareInterlocutors(list[mid], target) > 0) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }

    return left;
  }

  /// Функция сравнения собеседников по приоритету
  int _compareInterlocutors(Interlocutor a, Interlocutor b) {
    // сортировка собеседников по убыванию даты последних сообщений в чате
    if (a.lastSentAt != null && b.lastSentAt != null) {
      return b.lastSentAt!.compareTo(a.lastSentAt!);
    }
    if (a.lastSentAt != null) return -1;
    if (b.lastSentAt != null) return 1;

    // сортировка собеседников по алфавиту имен (нет последних сообщений в чате)
    final aName = '${a.firstName} ${a.lastName}'.toLowerCase();
    final bName = '${b.firstName} ${b.lastName}'.toLowerCase();
    return aName.compareTo(bName);
  }
}
