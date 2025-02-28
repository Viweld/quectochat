import 'package:dep_gen/dep_gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../domain/interfaces/i_chat_repository.dart';

part 'chat_bloc.freezed.dart';

part 'events.dart';

part 'states.dart';

@DepGen()
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({
    required String partnerId,
    @DepArg() required IChatRepository chatRepository,
  })  : _partnerId = partnerId,
        _chatRepository = chatRepository,
        super(const ChatState.view()) {
    on<ChatEvent>(
      (event, emitter) => event.map(
        onErrorReceived: (e) => _onErrorReceived(e, emitter),
        onInitializationRequested: (e) =>
            _onInitializationRequested(e, emitter),
      ),
    );

    _chatErrorsStreamSubscription =
        chatRepository.subscribeErrors(_chatErrorsStreamListener);
    add(const ChatEvent.onInitializationRequested());
  }

  // ЗАВИСИМОСТИ
  // ---------------------------------------------------------------------------
  final IChatRepository _chatRepository;

  // ДАННЫЕ:
  // ---------------------------------------------------------------------------
  final String _partnerId;

  // СТРИМЫ:
  // ---------------------------------------------------------------------------
  late ChatErrorsSubscription _chatErrorsStreamSubscription;

  void _chatErrorsStreamListener(ChatRepositoryError error) {
    if (isClosed) return;
    add(ChatEvent.onErrorReceived(message: error.message));
  }

  @override
  Future<void> close() async {
    await _chatRepository.cleanup();
    await _chatErrorsStreamSubscription.cancel();
    return super.close();
  }

  // МЕТОДЫ ОБРАБОТКИ СОБЫТИЙ:
  // ---------------------------------------------------------------------------
  /// Обработчик ВНУТРЕННЕГО события "запрос на инициализацию"
  Future<void> _onInitializationRequested(
    _EventOnInitializationRequested event,
    Emitter<ChatState> emitter,
  ) async {
    await _chatRepository.initialize(toId: _partnerId);
  }

  /// Обработчик ВНУТРЕННЕГО события "запрос на инициализацию"
  Future<void> _onErrorReceived(
      _EventOnErrorReceived e, Emitter<ChatState> emitter) async {
    emitter(ChatState.requestError(errorText: e.message));
    emitter(const ChatState.view());
  }
}
