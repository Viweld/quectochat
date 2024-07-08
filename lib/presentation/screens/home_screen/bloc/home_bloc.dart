import 'package:dep_gen/dep_gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quectochat/domain/interfaces/i_api_facade.dart';

import '../../../../domain/interfaces/i_auth_repository.dart';
import '../../../../domain/models/chat_list_item.dart';

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
  late Iterable<ChatListItem> _chatList;

  // МЕТОДЫ ОБРАБОТКИ СОБЫТИЙ:
  // ---------------------------------------------------------------------------
  /// Обработчик ВНУТРЕННЕГО события "запрос на инициализацию"
  Future<void> _onInitializationRequested(
    _EventOnInitializationRequested event,
    Emitter<HomeState> emitter,
  ) async {
    final users = await _facade.getUsers();
    // TODO(Vadim) #unimplemented временно подмешиваем фейковые данные
    _chatList = users.indexed.map((i) => ChatListItem(
          id: i.$2.id,
          firstName: i.$2.fullName.split(' ').first,
          lastName: i.$2.fullName.split(' ').last,
          lastMessageText: _fakeChatList.elementAt(i.$1).lastMessageText,
          lastMessageSentAt: _fakeChatList.elementAt(i.$1).lastMessageSentAt,
          isSentByYou: _fakeChatList.elementAt(i.$1).isSentByYou,
        ));
    _viewState = HomeState.view(chatList: _chatList) as _StateView;
    emitter(_viewState);
  }

  /// Обработчик ВНЕШНЕГО события "нажата кнопка очистки поля поиска"
  Future<void> _onSearchFieldClearTapped(
    _EventOnSearchFieldClearTapped event,
    Emitter<HomeState> emitter,
  ) async {
    _viewState = _viewState.copyWith(chatList: _chatList);
    emitter(_viewState);
  }

  /// Обработчик ВНЕШНЕГО события "изменен текст в поле поиска"
  Future<void> _onSearchTextChanged(
    _EventOnSearchTextChanged event,
    Emitter<HomeState> emitter,
  ) async {
    final searchSample = event.val.toLowerCase();
    final filteredChatList = searchSample.isEmpty
        ? _chatList
        : _chatList.where((item) {
            return item.firstName.toLowerCase().contains(searchSample) ||
                item.lastName.toLowerCase().contains(searchSample);
          });

    _viewState = _viewState.copyWith(chatList: filteredChatList);
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

Iterable<ChatListItem> _fakeChatList = [
  ChatListItem(
    id: '',
    firstName: 'Степан',
    lastName: 'Иванов',
    lastMessageText: 'Пришел я в кино а там ничего нет. '
        'Развернулся и ушел домой',
    lastMessageSentAt: DateTime.parse('2024-07-05 18:37:06.880429'),
    isSentByYou: true,
  ),
  ChatListItem(
    id: '',
    firstName: 'Геннадий',
    lastName: 'Купчихин',
    lastMessageText: 'Жил-был человек рассеянный на улице Бассейной',
    lastMessageSentAt: DateTime.parse('2024-07-05 18:35:06.880429'),
    isSentByYou: false,
  ),
  ChatListItem(
    id: '',
    firstName: 'Иннокентий',
    lastName: 'Клюшкин',
    lastMessageText:
        'На чем поехал в Ленинград человек рассеянный с улицы Бассейной?',
    lastMessageSentAt: DateTime.parse('2024-07-04 22:37:06.880429'),
    isSentByYou: false,
  ),
  ChatListItem(
    id: '',
    firstName: 'Маргарита',
    lastName: 'Широпопова',
    lastMessageText: 'Это не я',
    lastMessageSentAt: DateTime.parse('2024-07-03 22:37:06.880429'),
    isSentByYou: true,
  ),
  ChatListItem(
    id: '',
    firstName: 'Анна',
    lastName: 'Хотькудатова',
    lastMessageText: 'Пришел я в кино а там ничего нет. '
        'Развернулся и ушел домой',
    lastMessageSentAt: DateTime.parse('2002-02-27T14:00:00-0500'),
    isSentByYou: true,
  ),
  ChatListItem(
    id: '',
    firstName: 'Егор',
    lastName: 'Коромысликов',
    lastMessageText: 'Жил-был человек рассеянный на улице Бассейной',
    lastMessageSentAt: DateTime.parse('2024-07-03T14:00:00-0500'),
    isSentByYou: false,
  ),
  ChatListItem(
    id: '',
    firstName: 'Василий',
    lastName: 'Жбан',
    lastMessageText:
        'На чем поехал в Ленинград человек рассеянный с улицы Бассейной?',
    lastMessageSentAt: DateTime.parse('2024-06-28T14:00:00-0500'),
    isSentByYou: false,
  ),
  ChatListItem(
    id: '',
    firstName: 'Константин',
    lastName: 'Большебревников',
    lastMessageText: 'Это не я',
    lastMessageSentAt: DateTime.parse('2024-07-03T19:01:00-0500'),
    isSentByYou: true,
  ),
  ChatListItem(
    id: '',
    firstName: 'Козьма',
    lastName: 'Востропипов',
    lastMessageText: 'Пришел я в кино а там ничего нет. '
        'Развернулся и ушел домой',
    lastMessageSentAt: DateTime.parse('2002-02-27T14:00:00-0500'),
    isSentByYou: true,
  ),
  ChatListItem(
    id: '',
    firstName: 'Родеон',
    lastName: 'Трындотырский',
    lastMessageText: 'Жил-был человек рассеянный на улице Бассейной',
    lastMessageSentAt: DateTime.parse('2024-07-03T14:00:00-0500'),
    isSentByYou: false,
  ),
  ChatListItem(
    id: '',
    firstName: 'Ипполит',
    lastName: 'Коков',
    lastMessageText: 'Как поживаешь?',
    lastMessageSentAt: DateTime.parse('2024-06-28T14:00:00-0500'),
    isSentByYou: false,
  ),
  ChatListItem(
    id: '',
    firstName: 'Инна',
    lastName: 'Пышногривова',
    lastMessageText: 'Привет!',
    lastMessageSentAt: DateTime.parse('2024-07-03T19:01:00-0500'),
    isSentByYou: true,
  ),
];
