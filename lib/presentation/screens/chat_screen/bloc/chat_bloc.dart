import 'package:dep_gen/dep_gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quectochat/domain/interfaces/i_api_facade.dart';
import 'package:quectochat/domain/models/chat_message_type.dart';

import '../../../../domain/models/chat_message.dart';

part 'chat_bloc.freezed.dart';

part 'events.dart';

part 'states.dart';

@DepGen()
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({
    required String toId,
    @DepArg() required INetworkFacade facade,
  })  : _toId = toId,
        _facade = facade,
        super(const ChatState.pending()) {
    on<ChatEvent>(
      (event, emitter) => event.map(
        onStateChanged: (e) => emitter(_viewState),
        onInitializationRequested: (e) =>
            _onInitializationRequested(e, emitter),
        onMessageChanged: (e) => _onMessageChanged(e, emitter),
        onSendTapped: (e) => _onSendTapped(e, emitter),
      ),
    );

    _messagesStream.listen(_messagesStreamListener);

    add(const ChatEvent.onInitializationRequested());
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
    add(const ChatEvent.onStateChanged());
  }

  // МЕТОДЫ ОБРАБОТКИ СОБЫТИЙ:
  // ---------------------------------------------------------------------------
  Future<void> _onInitializationRequested(
    _EventOnInitializationRequested event,
    Emitter<ChatState> emitter,
  ) async {
    // 1. Подписываемся на стрим новых сообщений
    _messagesStream = _facade.getNewMessagesStream(toId: _toId);

    // 2. Получаем первую страницу имеющихся сообщений
    final messagesFirstPage = await _facade.getChatMessages(toId: _toId);
    _viewState = ChatState.view(messages: messagesFirstPage) as _StateView;
    emitter(_viewState);
  }

  void _onMessageChanged(
    _EventOnMessageChanged event,
    Emitter<ChatState> emitter,
  ) {
    _viewState = _viewState.copyWith(typedMessage: event.val);
    emitter(_viewState);
  }

  void _onSendTapped(
    _EventOnSendTapped event,
    Emitter<ChatState> emitter,
  ) {
    _facade.sendMessage(
      toId: _toId,
      content: _viewState.typedMessage,
      type: ChatMessageType.text,
    );
    _viewState = _viewState.copyWith(typedMessage: '');
    emitter(_viewState);
  }
}
