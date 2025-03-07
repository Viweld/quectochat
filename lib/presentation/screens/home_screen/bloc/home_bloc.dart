import 'package:dep_gen/dep_gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quectochat/domain/interfaces/i_home_repository.dart';

import '../../../../domain/interfaces/i_auth_repository.dart';
import '../../../../domain/models/interlocutor.dart';
import '../../../../domain/utils/debouncer.dart';

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
        onFetchRequested: (e) => _onFetchRequested(e, emitter),
        onSearchFieldClearTapped: (e) => _onSearchFieldClearTapped(e, emitter),
        onSearchTextChanged: (e) => _onSearchTextChanged(e, emitter),
        onNextPageRequested: (e) => _onNextPageRequested(e, emitter),
        onClearChatRequested: (e) => _onClearChatRequested(e, emitter),
        onStateChanged: (_) => emitter(_viewState),
      ),
    );

    _debouncer = Debouncer<_StateView>(callBack: _onDebouncerCalled);

    add(const HomeEvent.onInitializationRequested());
  }

  // ЗАВИСИМОСТИ
  // ---------------------------------------------------------------------------
  final IAuthRepository _authRepository;
  final IHomeRepository _homeRepository;

  // СОСТОЯНИЕ
  // ---------------------------------------------------------------------------
  _StateView _viewState = HomeState.view() as _StateView;

  // СТРИМЫ:
  // ---------------------------------------------------------------------------
  late InterlocutorsSubscription _interlocutorsSubscription;

  @override
  Future<void> close() async {
    await _interlocutorsSubscription.cancel();
    return super.close();
  }

  /// получая из стрима сеты с обновленными собеседниками заменяет ими имеющихся
  /// в списке (при совпадении id), либо вставляет в список соблюдая правила сортировки
  void _interlocutorsListener(Set<Interlocutor> updatedInterlocutors) {
    if (isClosed) return;
    if (_viewState.isFirstLoading) return;

    final interlocutors = _viewState.interlocutors.toList();

    for (final updated in updatedInterlocutors) {
      final index = interlocutors.indexWhere((i) => i.userId == updated.userId);

      if (index != -1) {
        // Если собеседник уже есть, заменяем его на новую версию
        interlocutors[index] = updated;
      } else {
        // Определяем позицию для вставки
        int insertIndex = _findInsertPosition(interlocutors, updated);

        // Проверяем, не попадает ли новый собеседник в конец списка (где идет пагинация)
        if (insertIndex < interlocutors.length) {
          interlocutors.insert(insertIndex, updated);
        }
      }
    }

    _viewState = _viewState.copyWith(interlocutors: interlocutors);
    add(HomeEvent.onStateChanged());
  }

  // ДЕБАУНСЕР:
  // ---------------------------------------------------------------------------
  late final Debouncer<_StateView> _debouncer;

  /// Коллбэк дебаунсера
  void _onDebouncerCalled(_StateView? viewState) {
    if (isClosed) return;
    add(const HomeEvent.onFetchRequested());
  }

  // МЕТОДЫ ОБРАБОТКИ СОБЫТИЙ:
  // ---------------------------------------------------------------------------
  /// Обработчик ВНУТРЕННЕГО события "запрос на инициализацию"
  Future<void> _onInitializationRequested(
    _EventOnInitializationRequested event,
    Emitter<HomeState> emitter,
  ) async {
    // 1. Загружаем первую страницу собеседников
    add(const HomeEvent.onFetchRequested());

    // 2. Подписываемся на стрим с обновленными собеседниками
    _interlocutorsSubscription =
        _homeRepository.subscribe(_interlocutorsListener);
  }

  // ---------------------------------------------------------------------------
  /// Обработчик ВНУТРЕННЕГО события "запрошена загрузка данных"
  Future<void> _onFetchRequested(
    _EventOnFetchRequested event,
    Emitter<HomeState> emitter,
  ) async {
    _viewState = _viewState.copyWith(
      searchId: _viewState.searchId + 1,
      isFirstLoading: true,
    );
    await _getInterlocutors(
      emitter,
      searchId: _viewState.searchId,
      isNextPageRequired: false,
    );
  }

  // ---------------------------------------------------------------------------
  /// Обработчик ВНЕШНЕГО события "запрошена следующая страница"
  Future<void> _onNextPageRequested(
    _EventOnNextPageRequested event,
    Emitter<HomeState> emitter,
  ) async {
    if (!_viewState.hasNext) return;
    await _getInterlocutors(
      emitter,
      searchId: _viewState.searchId,
      isNextPageRequired: true,
    );
  }

  // ---------------------------------------------------------------------------
  /// Обработчик ВНЕШНЕГО события "запрошена следующая страница"
  Future<void> _onClearChatRequested(
    _EventOnClearChatRequested event,
    Emitter<HomeState> emitter,
  ) async {
    await _homeRepository.clearChat(interlocutorId: event.interlocutorId);
  }

  /// Обработчик ВНЕШНЕГО события "нажата кнопка очистки поля поиска"
  Future<void> _onSearchFieldClearTapped(
    _EventOnSearchFieldClearTapped event,
    Emitter<HomeState> emitter,
  ) async {
    if (_viewState.searchText.isEmpty) return;
    _viewState = _viewState.copyWith(searchText: '');
    emitter(_viewState);
    add(const HomeEvent.onFetchRequested());
  }

  /// Обработчик ВНЕШНЕГО события "изменен текст в поле поиска"
  Future<void> _onSearchTextChanged(
    _EventOnSearchTextChanged event,
    Emitter<HomeState> emitter,
  ) async {
    final searchText = event.val.toLowerCase();
    _viewState = _viewState.copyWith(searchText: searchText);
    emitter(_viewState);
    _debouncer.onEvent(_viewState);
  }

  /// Обработчик ВНЕШНЕГО события "нажата кнопка выйти"
  Future<void> _onLogoutTapped(
    _EventOnLogoutTapped event,
    Emitter<HomeState> emitter,
  ) async {
    // 1. Если уже в процессе, то прерываем:
    if (_viewState.isLogoutLoading) return;

    // 2. Запускаем прелоадер:
    _viewState = _viewState.copyWith(isLogoutLoading: true);
    emitter(_viewState);

    // 3. Выполняем выход:
    try {
      await _authRepository.logOut();
    } on Object {
      emitter(const HomeState.requestError());
      rethrow;
    } finally {
      // 4. Вырубаем прелоадер:
      _viewState = _viewState.copyWith(isLogoutLoading: false);
      emitter(_viewState);
    }
  }

  // ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ:
  // ---------------------------------------------------------------------------
  /// Загрузчик загрузчик собеседников
  Future<void> _getInterlocutors(
    Emitter<HomeState> emitter, {
    required int searchId,
    required bool isNextPageRequired,
  }) async {
    try {
      final interlocutors = await _homeRepository.getInterlocutors(
        search: _viewState.searchText,
        lastInterlocutorId:
            isNextPageRequired ? null : _viewState.interlocutors.last.userId,
      );
      // если пока скачивалось searchId изменился, то прерываем
      if (searchId != _viewState.searchId) return;
      _viewState = _viewState.copyWith(
        interlocutors:
            _viewState.interlocutors.followedBy(interlocutors.result),
        hasNext: interlocutors.hasNext,
      );
      emitter(_viewState);
    } on Object {
      super.state is _StatePending
          ? emitter(const HomeState.initializationError())
          : emitter(const HomeState.requestError());
      rethrow;
    } finally {
      _viewState = _viewState.copyWith(isFirstLoading: false);
      emitter(_viewState);
    }
  }

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
