import 'package:dep_gen/dep_gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quectochat/domain/interfaces/i_api_facade.dart';
import 'package:quectochat/domain/models/chat_message_type.dart';

part 'typing_view_bloc.freezed.dart';

part 'events.dart';

part 'states.dart';

@DepGen()
class TypingViewBloc extends Bloc<TypingViewEvent, TypingViewState> {
  TypingViewBloc({
    required String toId,
    @DepArg() required INetworkFacade facade,
  })  : _toId = toId,
        _facade = facade,
        super(const TypingViewState.view()) {
    on<TypingViewEvent>(
      (event, emitter) => event.map(
        onMessageChanged: (e) => _onMessageChanged(e, emitter),
        onSendTapped: (e) => _onSendTapped(e, emitter),
      ),
    );

    _viewState = super.state as _StateView;
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

  // МЕТОДЫ ОБРАБОТКИ СОБЫТИЙ:
  // ---------------------------------------------------------------------------
  /// Обработчик ВНЕШНЕГО события "изменен текст в поле написания сообщения"
  void _onMessageChanged(
    _EventOnMessageChanged event,
    Emitter<TypingViewState> emitter,
  ) {
    _viewState = _viewState.copyWith(typedMessage: event.val);
    emitter(_viewState);
  }

  /// Обработчик ВНЕШНЕГО события "нажата кнопка отправить"
  Future<void> _onSendTapped(
    _EventOnSendTapped event,
    Emitter<TypingViewState> emitter,
  ) async {
    if (_viewState.typedMessage.trim().isEmpty) return;
    await _facade.sendMessage(
      toId: _toId,
      content: _viewState.typedMessage,
      type: ChatMessageType.text,
    );
    _viewState = _viewState.copyWith(
      typedMessage: '',
      // messages: _viewState.messages.followedBy([sentMessage]),
    );
    emitter(_viewState);
  }
}
