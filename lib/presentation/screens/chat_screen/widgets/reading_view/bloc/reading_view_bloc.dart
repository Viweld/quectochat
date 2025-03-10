import 'package:dep_gen/dep_gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../domain/interfaces/i_chat_repository.dart';
import '../../../../../../domain/models/message.dart';

part 'reading_view_bloc.freezed.dart';

part 'events.dart';

part 'states.dart';

@DepGen()
class ReadingViewBloc extends Bloc<ReadingViewEvent, ReadingViewState> {
  ReadingViewBloc({
    @DepArg() required IChatRepository chatRepository,
  })  : _chatRepository = chatRepository,
        super(const ReadingViewState.pending()) {
    on<ReadingViewEvent>(
      (event, emitter) => event.map(
        onStateChanged: (e) => emitter(_viewState),
        onNextPageRequested: (e) => _onNextPageRequested(e, emitter),
      ),
    );

    _chatMessagesStreamSubscription =
        chatRepository.subscribeEvents(_chatMessagesStreamListener);
  }

  // ЗАВИСИМОСТИ
  // ---------------------------------------------------------------------------
  final IChatRepository _chatRepository;

  // СОСТОЯНИЕ
  // ---------------------------------------------------------------------------
  late _StateView _viewState;

  // СТРИМЫ:
  // ---------------------------------------------------------------------------
  late ChatMessagesSubscription _chatMessagesStreamSubscription;

  void _chatMessagesStreamListener(Iterable<Message> messages) {
    if (super.state is _StatePending) {
      _viewState = ReadingViewState.view(messages: []) as _StateView;
    }
    final List<Message> updatedMessages = [];

    final Iterator<Message> oldIter = _viewState.messages.iterator;
    final Iterator<Message> newIter = messages.iterator;

    bool hasOld = oldIter.moveNext();
    bool hasNew = newIter.moveNext();

    while (hasOld || hasNew) {
      if (!hasNew) {
        updatedMessages.add(oldIter.current);
        hasOld = oldIter.moveNext();
      } else if (!hasOld) {
        updatedMessages.add(newIter.current);
        hasNew = newIter.moveNext();
      } else if (oldIter.current.id == newIter.current.id) {
        updatedMessages.add(newIter.current); // Заменяем существующее
        hasOld = oldIter.moveNext();
        hasNew = newIter.moveNext();
      } else if (oldIter.current.createdAt
          .isBefore(newIter.current.createdAt)) {
        updatedMessages.add(oldIter.current);
        hasOld = oldIter.moveNext();
      } else {
        updatedMessages.add(newIter.current);
        hasNew = newIter.moveNext();
      }
    }

    _viewState = _viewState.copyWith(messages: updatedMessages);

    if (isClosed) return;
    add(const ReadingViewEvent.onStateChanged());
  }

  @override
  Future<void> close() async {
    await _chatMessagesStreamSubscription.cancel();
    return super.close();
  }

  // МЕТОДЫ ОБРАБОТКИ СОБЫТИЙ:
  // ---------------------------------------------------------------------------
  /// Обработчик ВНУТРЕННЕГО события "запрос на инициализацию"
  Future<void> _onNextPageRequested(
    _EventOnInitializationRequested event,
    Emitter<ReadingViewState> emitter,
  ) async {
    try {
      // await _chatRepository.fetchNextMessages();
    } on Object {
      rethrow;
    } finally {
      // TODO(Vadim): #idea тут можно добавить остановку анимации отправки сообщения
    }
  }
}
