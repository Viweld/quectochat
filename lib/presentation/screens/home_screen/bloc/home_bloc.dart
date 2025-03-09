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
        onSearchRequested: (e) => _onSearchRequested(e, emitter),
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

  // ДЕБАУНСЕР:
  // ---------------------------------------------------------------------------
  late final Debouncer<_StateView> _debouncer;

  /// Коллбэк дебаунсера
  void _onDebouncerCalled(_StateView? viewState) {
    if (isClosed) return;
    add(const HomeEvent.onSearchRequested());
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
        _homeRepository.subscribe(_interlocutorsStreamListener);
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
    _viewState = _viewState.copyWith(
      searchText: '',
      isSearchMode: false,
    );
    emitter(_viewState);
    add(const HomeEvent.onFetchRequested());
  }

  /// Обработчик ВНЕШНЕГО события "изменен текст в поле поиска"
  Future<void> _onSearchTextChanged(
    _EventOnSearchTextChanged event,
    Emitter<HomeState> emitter,
  ) async {
    _viewState = _viewState.copyWith(
      searchText: event.val,
      isSearchMode: event.val.isNotEmpty,
    );
    _debouncer.onEvent(_viewState);
  }

  // ---------------------------------------------------------------------------
  /// Обработчик ВНУТРЕННЕГО события "запрошен поиск данных"
  Future<void> _onSearchRequested(
    _EventOnSearchRequested event,
    Emitter<HomeState> emitter,
  ) async {
    final searchId = _viewState.searchId;
    try {
      final foundInterlocutors = await _homeRepository.searchInterlocutors(
        searchText: _viewState.searchText,
      );

      // если пока скачивалось searchId изменился, то прерываем
      if (searchId != _viewState.searchId) return;
      _viewState = _viewState.copyWith(
        interlocutors: foundInterlocutors,
        hasNext: false,
      );
      emitter(_viewState);
    } on Object {
      super.state is _StatePending
          ? emitter(const HomeState.initializationError())
          : emitter(const HomeState.requestError());
      rethrow;
    }
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
      if (isNextPageRequired) {
        final interlocutors = await _homeRepository.getInterlocutors(
          lastInterlocutorId: _viewState.interlocutors.last.userId,
        );
        // если пока скачивалось searchId изменился, то прерываем
        if (searchId != _viewState.searchId) return;
        _viewState = _viewState.copyWith(
          interlocutors:
              _viewState.interlocutors.followedBy(interlocutors.result),
          hasNext: interlocutors.hasNext,
        );
        emitter(_viewState);
      } else {
        final interlocutors = await _homeRepository.getInterlocutors();
        // если пока скачивалось searchId изменился, то прерываем
        if (searchId != _viewState.searchId) return;
        _viewState = _viewState.copyWith(
          interlocutors: interlocutors.result,
          hasNext: interlocutors.hasNext,
        );
        emitter(_viewState);
      }
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

  /// получая из стрима сеты с обновленными собеседниками заменяет ими имеющихся
  /// в списке (при совпадении id), либо вставляет в список соблюдая правила сортировки
  void _interlocutorsStreamListener(Set<Interlocutor> updatedInterlocutors) {
    if (isClosed) return;
    if (_viewState.isSearchMode) return;
    if (_viewState.isFirstLoading) return;

    final interlocutors = _viewState.interlocutors.toList();

    for (final updated in updatedInterlocutors) {
      final index = interlocutors.indexWhere((i) => i.userId == updated.userId);

      if (index != -1) {
        final existing = interlocutors[index];

        final hadLastSentData = existing.lastSentAt != null &&
            existing.lastSentContent != null &&
            existing.lastSentContentType != null;
        final lostLastSentData = updated.lastSentAt == null &&
            updated.lastSentContent == null &&
            updated.lastSentContentType == null;

        if (hadLastSentData && lostLastSentData) {
          // Если обновленный собеседник потерял lastSent данные, удаляем старого
          interlocutors.removeAt(index);

          // Ищем место в алфавитном порядке
          int insertIndex = _findInsertPositionAlpha(interlocutors, updated);

          if (insertIndex < interlocutors.length) {
            interlocutors.insert(insertIndex, updated);
          }
        } else {
          // Обычное обновление (не теряет lastSent данные)
          interlocutors[index] = updated;
        }
      } else {
        // Вставка нового собеседника по стандартным правилам
        int insertIndex = _findInsertPosition(interlocutors, updated);

        if (insertIndex < interlocutors.length) {
          interlocutors.insert(insertIndex, updated);
        }
      }
    }

    _viewState = _viewState.copyWith(interlocutors: interlocutors);
    add(HomeEvent.onStateChanged());
  }

  /// Бинарный поиск для нахождения позиции вставки (основной порядок)
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

  /// Бинарный поиск для вставки в алфавитный порядок
  int _findInsertPositionAlpha(List<Interlocutor> list, Interlocutor target) {
    int left = 0, right = list.length;

    while (left < right) {
      int mid = (left + right) ~/ 2;
      if (_compareInterlocutorsAlpha(list[mid], target) > 0) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }

    return left;
  }

  /// Сравнение собеседников по основному порядку (по lastSentAt)
  int _compareInterlocutors(Interlocutor a, Interlocutor b) {
    if (a.lastSentAt != null && b.lastSentAt != null) {
      return b.lastSentAt!.compareTo(a.lastSentAt!);
    }
    if (a.lastSentAt != null) return -1;
    if (b.lastSentAt != null) return 1;

    return _compareInterlocutorsAlpha(a, b);
  }

  /// Сравнение по алфавитному порядку (для вставки в конец)
  int _compareInterlocutorsAlpha(Interlocutor a, Interlocutor b) {
    final aName = '${a.firstName} ${a.lastName}'.toLowerCase();
    final bName = '${b.firstName} ${b.lastName}'.toLowerCase();
    return aName.compareTo(bName);
  }
}
