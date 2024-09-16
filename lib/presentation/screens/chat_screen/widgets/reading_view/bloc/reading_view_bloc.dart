import 'package:dep_gen/dep_gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quectochat/domain/interfaces/i_api_facade.dart';

import '../../../../../../domain/models/chat_message.dart';

part 'reading_view_bloc.freezed.dart';

part 'events.dart';

part 'states.dart';

@DepGen()
class ReadingViewBloc extends Bloc<ReadingViewEvent, ReadingViewState> {
  ReadingViewBloc({
    required String toId,
    @DepArg() required INetworkFacade facade,
  })  : _toId = toId,
        _facade = facade,
        super(const ReadingViewState.pending()) {
    on<ReadingViewEvent>(
      (event, emitter) => event.map(
        onStateChanged: (e) => emitter(_viewState),
        onInitializationRequested: (e) =>
            _onInitializationRequested(e, emitter),
      ),
    );

    add(const ReadingViewEvent.onInitializationRequested());
  }

  // ЗАВИСИМОСТИ
  // ---------------------------------------------------------------------------
  final INetworkFacade _facade;

  // СОСТОЯНИЕ
  // ---------------------------------------------------------------------------
  late _StateView _viewState;

  // ПРИВАТНЫЕ ДАННЫЕ:
  // ---------------------------------------------------------------------------
  final String _toId;

  // СТРИМЫ:
  // ---------------------------------------------------------------------------
  late Stream<ChatMessage> _messagesStream;

  void _messagesStreamListener(ChatMessage newMessage) {
    _viewState = _viewState.copyWith(
      messages: _viewState.messages.followedBy([newMessage]),
    );
    if (isClosed) return;
    add(const ReadingViewEvent.onStateChanged());
  }

  // МЕТОДЫ ОБРАБОТКИ СОБЫТИЙ:
  // ---------------------------------------------------------------------------
  /// Обработчик ВНУТРЕННЕГО события "запрос на инициализацию"
  Future<void> _onInitializationRequested(
    _EventOnInitializationRequested event,
    Emitter<ReadingViewState> emitter,
  ) async {
    // 1. Подписываемся на стрим новых сообщений
    _messagesStream = _facade.getNewMessagesStream(toId: _toId);
    _messagesStream.listen(_messagesStreamListener);

    // 2. Получаем первую страницу имеющихся сообщений
    final messagesFirstPage = await _facade.getChatMessages(toId: _toId);
    _viewState =
        ReadingViewState.view(messages: messagesFirstPage) as _StateView;
    emitter(_viewState);
  }
}
