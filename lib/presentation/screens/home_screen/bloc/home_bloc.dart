import 'package:dep_gen/dep_gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/interfaces/i_auth_repository.dart';
import '../../../../domain/models/chat_list_item.dart';

part 'home_bloc.freezed.dart';

part 'events.dart';

part 'states.dart';

@DepGen()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    @DepArg() required IAuthRepository authRepository,
  })  : _authRepository = authRepository,
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

  // СОСТОЯНИЕ
  // ---------------------------------------------------------------------------
  late _StateView _viewState;

  // ПРИВАТНЫЕ ДАННЫЕ:
  // ---------------------------------------------------------------------------
  late Iterable<ChatListItem> _chatList;

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

  Future<void> _onInitializationRequested(
    _EventOnInitializationRequested event,
    Emitter<HomeState> emitter,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    // TODO(Vadim): #unimplemented
    _chatList = await Future.delayed(
      const Duration(seconds: 2),
      () => _fakeChatList,
    );

    _viewState = HomeState.view(chatList: _chatList) as _StateView;
    emitter(_viewState);
  }

  Future<void> _onSearchFieldClearTapped(
    _EventOnSearchFieldClearTapped event,
    Emitter<HomeState> emitter,
  ) async {
    _viewState = _viewState.copyWith(chatList: _chatList);
    emitter(_viewState);
  }

  Future<void> _onSearchTextChanged(
    _EventOnSearchTextChanged event,
    Emitter<HomeState> emitter,
  ) async {
    final searchSample = event.val;
    final filteredChatList = searchSample.isEmpty
        ? _chatList
        : _chatList.where((item) {
            return item.firstName.contains(searchSample) ||
                item.lastName.contains(searchSample);
          });

    _viewState = _viewState.copyWith(chatList: filteredChatList);
    emitter(_viewState);
  }
}

Iterable<ChatListItem> _fakeChatList = [
  ChatListItem(
    firstName: 'Степан',
    lastName: 'Иванов',
    lastMessageText: 'Пришел я в кино а там ничего нет. '
        'Развернулся и ушел домой',
    lastMessageSentAt: DateTime.parse('2024-07-05T16:31:00-0500'),
    isSentByYou: true,
  ),
  ChatListItem(
    firstName: 'Геннадий',
    lastName: 'Купчихин',
    lastMessageText: 'Жил-был человек рассеянный на улице Бассейной',
    lastMessageSentAt: DateTime.parse('2024-07-05T16:25:00-0500'),
    isSentByYou: false,
  ),
  ChatListItem(
    firstName: 'Иннокентий',
    lastName: 'Клюшкин',
    lastMessageText:
        'На чем поехал в Ленинград человек рассеянный с улицы Бассейной?',
    lastMessageSentAt: DateTime.parse('2024-07-04T14:00:00-0500'),
    isSentByYou: false,
  ),
  ChatListItem(
    firstName: 'Маргарита',
    lastName: 'Широпопова',
    lastMessageText: 'Это не я',
    lastMessageSentAt: DateTime.parse('2024-07-03T19:01:00-0500'),
    isSentByYou: true,
  ),
  ChatListItem(
    firstName: 'Анна',
    lastName: 'Хотькудатова',
    lastMessageText: 'Пришел я в кино а там ничего нет. '
        'Развернулся и ушел домой',
    lastMessageSentAt: DateTime.parse('2002-02-27T14:00:00-0500'),
    isSentByYou: true,
  ),
  ChatListItem(
    firstName: 'Егор',
    lastName: 'Коромысликов',
    lastMessageText: 'Жил-был человек рассеянный на улице Бассейной',
    lastMessageSentAt: DateTime.parse('2024-07-03T14:00:00-0500'),
    isSentByYou: false,
  ),
  ChatListItem(
    firstName: 'Василий',
    lastName: 'Жбан',
    lastMessageText:
        'На чем поехал в Ленинград человек рассеянный с улицы Бассейной?',
    lastMessageSentAt: DateTime.parse('2024-06-28T14:00:00-0500'),
    isSentByYou: false,
  ),
  ChatListItem(
    firstName: 'Константин',
    lastName: 'Большебревников',
    lastMessageText: 'Это не я',
    lastMessageSentAt: DateTime.parse('2024-07-03T19:01:00-0500'),
    isSentByYou: true,
  ),
  ChatListItem(
    firstName: 'Козьма',
    lastName: 'Востропипов',
    lastMessageText: 'Пришел я в кино а там ничего нет. '
        'Развернулся и ушел домой',
    lastMessageSentAt: DateTime.parse('2002-02-27T14:00:00-0500'),
    isSentByYou: true,
  ),
  ChatListItem(
    firstName: 'Родеон',
    lastName: 'Трындотырский',
    lastMessageText: 'Жил-был человек рассеянный на улице Бассейной',
    lastMessageSentAt: DateTime.parse('2024-07-03T14:00:00-0500'),
    isSentByYou: false,
  ),
  ChatListItem(
    firstName: 'Ипполит',
    lastName: 'Коков',
    lastMessageText: 'Как поживаешь?',
    lastMessageSentAt: DateTime.parse('2024-06-28T14:00:00-0500'),
    isSentByYou: false,
  ),
  ChatListItem(
    firstName: 'Инна',
    lastName: 'Пышногривова',
    lastMessageText: 'Привет!',
    lastMessageSentAt: DateTime.parse('2024-07-03T19:01:00-0500'),
    isSentByYou: true,
  ),
];
