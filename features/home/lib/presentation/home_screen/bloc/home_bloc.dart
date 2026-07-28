import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home/domain/repositories/home_repository.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @factoryMethod
  HomeBloc(this._authSessionPort, this._homeRepository, this._blocErrorHandler)
    : super(const HomeState()) {
    on<HomeEvent>((HomeEvent event, Emitter<HomeState> emit) {
      if (event is _EventOnLogoutTapped || event is _EventOnSearchTextChanged) return;
      event.map(
        onInitializationRequested: (_) => _onInitializationRequested(emit),
        onFetchRequested: (_) => _onFetchRequested(emit),
        onSearchRequested: (_) => _onSearchRequested(emit),
        onSearchFieldClearTapped: (_) => _onSearchFieldClearTapped(emit),
        onNextPageRequested: (_EventOnNextPageRequested event) => _onNextPageRequested(event, emit),
        onSearchTextChanged: (_) {},
        onLogoutTapped: (_) {},
        onClearChatRequested: (_EventOnClearChatRequested event) =>
            _onClearChatRequested(event, emit),
        onInterlocutorsStreamUpdated: (_EventOnInterlocutorsStreamUpdated event) =>
            _onInterlocutorsStreamUpdated(event, emit),
      );
    });
    on<_EventOnLogoutTapped>(_onLogoutTapped, transformer: droppable());
    on<_EventOnSearchTextChanged>(_onSearchTextChanged, transformer: restartable());

    _debouncer = Debouncer<HomeState>(callBack: _onDebouncerCalled);

    add(const HomeEvent.onInitializationRequested());
  }

  final AuthSessionPort _authSessionPort;
  final HomeRepository _homeRepository;
  final BlocErrorHandler _blocErrorHandler;

  late InterlocutorsSubscription _interlocutorsSubscription;
  late final Debouncer<HomeState> _debouncer;

  @override
  Future<void> close() async {
    await _interlocutorsSubscription.cancel();
    return super.close();
  }

  void _onDebouncerCalled(HomeState? viewState) {
    if (isClosed) return;
    state.isSearchMode
        ? add(const HomeEvent.onSearchRequested())
        : add(const HomeEvent.onFetchRequested());
  }

  Future<void> _onInitializationRequested(Emitter<HomeState> emit) async {
    unawaited(_homeRepository.initialize());
    add(const HomeEvent.onFetchRequested());
    _interlocutorsSubscription = _homeRepository.subscribe(_interlocutorsStreamListener);
  }

  Future<void> _onFetchRequested(Emitter<HomeState> emit) async {
    await _getInterlocutors(emit, searchId: state.searchId, isNextPageRequired: false);
  }

  Future<void> _onNextPageRequested(
    _EventOnNextPageRequested event,
    Emitter<HomeState> emit,
  ) async {
    if (!state.hasNext) return;
    if (state.isNextLoading) return;
    emit(state.copyWith(searchId: state.searchId + 1, isNextLoading: true));
    await _getInterlocutors(emit, searchId: state.searchId, isNextPageRequired: true);
  }

  Future<void> _onClearChatRequested(
    _EventOnClearChatRequested event,
    Emitter<HomeState> emit,
  ) async {
    try {
      await _homeRepository.clearChat(interlocutorId: event.interlocutorId);
      final Iterable<Interlocutor> changedInterlocutors = state.interlocutors.map(
        (Interlocutor item) => item.userId != event.interlocutorId
            ? item
            : Interlocutor(userId: item.userId, firstName: item.firstName, lastName: item.lastName),
      );
      emit(state.copyWith(interlocutors: changedInterlocutors, searchId: state.searchId + 1));
    } on Object catch (error, stackTrace) {
      final ErrorPresentation presentation = _blocErrorHandler.handle(
        error,
        stackTrace: stackTrace,
      );
      if (presentation.shouldRethrow) rethrow;
    }
  }

  Future<void> _onSearchFieldClearTapped(Emitter<HomeState> emit) async {
    if (state.searchText.isEmpty) return;
    emit(state.copyWith(searchText: '', isSearchMode: false));
    add(const HomeEvent.onFetchRequested());
  }

  Future<void> _onSearchTextChanged(
    _EventOnSearchTextChanged event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(searchText: event.val, isSearchMode: event.val.isNotEmpty));
    _debouncer.onEvent(state);
  }

  Future<void> _onSearchRequested(Emitter<HomeState> emit) async {
    final int searchId = state.searchId;
    try {
      final Iterable<Interlocutor> foundInterlocutors = await _homeRepository.searchInterlocutors(
        searchText: state.searchText,
      );
      if (searchId != state.searchId) return;
      emit(state.copyWith(interlocutors: foundInterlocutors, hasNext: false));
    } on Object catch (error, stackTrace) {
      final ErrorPresentation presentation = _blocErrorHandler.handle(
        error,
        stackTrace: stackTrace,
      );
      if (presentation.shouldRethrow) rethrow;
    }
  }

  Future<void> _onLogoutTapped(_EventOnLogoutTapped event, Emitter<HomeState> emit) async {
    if (state.isLogoutLoading) return;

    emit(state.copyWith(isLogoutLoading: true));

    try {
      await _authSessionPort.logOut();
    } on Object catch (error, stackTrace) {
      final ErrorPresentation presentation = _blocErrorHandler.handle(
        error,
        stackTrace: stackTrace,
      );
      if (presentation.shouldRethrow) rethrow;
    } finally {
      emit(state.copyWith(isLogoutLoading: false));
    }
  }

  Future<void> _getInterlocutors(
    Emitter<HomeState> emit, {
    required int searchId,
    required bool isNextPageRequired,
  }) async {
    try {
      if (isNextPageRequired) {
        final Paginated<Interlocutor> interlocutors = await _homeRepository.getInterlocutors(
          lastInterlocutorId: state.interlocutors.last.userId,
        );
        if (searchId != state.searchId) return;
        emit(
          state.copyWith(
            interlocutors: state.interlocutors.followedBy(interlocutors.result),
            hasNext: interlocutors.hasNext,
            isNextLoading: false,
          ),
        );
      } else {
        final Paginated<Interlocutor> interlocutors = await _homeRepository.getInterlocutors();
        if (searchId != state.searchId) return;
        emit(
          state.copyWith(
            interlocutors: interlocutors.result,
            hasNext: interlocutors.hasNext,
            isFirstLoading: false,
          ),
        );
      }
    } on Object catch (error, stackTrace) {
      final ErrorPresentation presentation = _blocErrorHandler.handle(
        error,
        stackTrace: stackTrace,
      );
      if (presentation.shouldRethrow) rethrow;
    } finally {
      emit(state.copyWith(isFirstLoading: false, isNextLoading: false));
    }
  }

  void _onInterlocutorsStreamUpdated(
    _EventOnInterlocutorsStreamUpdated event,
    Emitter<HomeState> emit,
  ) {
    if (state.isSearchMode) return;
    if (state.isFirstLoading) return;

    final List<Interlocutor> interlocutors = state.interlocutors.toList();
    final List<Interlocutor> updatedList = event.updated.toList();

    for (final Interlocutor updated in updatedList) {
      final int index = interlocutors.indexWhere((Interlocutor i) => i.userId == updated.userId);

      if (index != -1) {
        interlocutors[index] = updated;
      } else {
        interlocutors.add(updated);
      }
    }
    interlocutors.sort(_compareInterlocutors);

    emit(state.copyWith(interlocutors: interlocutors, searchId: state.searchId + 1));
  }

  void _interlocutorsStreamListener(Set<Interlocutor> updatedInterlocutors) {
    if (isClosed) return;
    add(HomeEvent.onInterlocutorsStreamUpdated(updated: updatedInterlocutors));
  }

  int _compareInterlocutors(Interlocutor a, Interlocutor b) {
    final bool aHasLastSent = a.lastSentAt != null;
    final bool bHasLastSent = b.lastSentAt != null;

    if (aHasLastSent && bHasLastSent) {
      return b.lastSentAt!.compareTo(a.lastSentAt!);
    } else if (aHasLastSent) {
      return -1;
    } else if (bHasLastSent) {
      return 1;
    } else {
      return _compareInterlocutorsAlpha(a, b);
    }
  }

  int _compareInterlocutorsAlpha(Interlocutor a, Interlocutor b) {
    final String aName = '${a.firstName} ${a.lastName}'.toLowerCase();
    final String bName = '${b.firstName} ${b.lastName}'.toLowerCase();
    return aName.compareTo(bName);
  }
}
