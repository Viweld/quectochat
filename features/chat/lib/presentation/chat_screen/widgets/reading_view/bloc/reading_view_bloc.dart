import 'package:chat/domain/entities/message.dart';
import 'package:chat/domain/repositories/chat_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_core/core.dart';

part 'reading_view_bloc.freezed.dart';
part 'reading_view_effect.dart';
part 'reading_view_event.dart';
part 'reading_view_state.dart';

@injectable
class ReadingViewBloc extends Bloc<ReadingViewEvent, ReadingViewState> {
  @factoryMethod
  ReadingViewBloc(this._chatRepository, this._blocErrorHandler) : super(const ReadingViewState()) {
    on<ReadingViewEvent>(
      (ReadingViewEvent event, Emitter<ReadingViewState> emit) => event.map(
        onNextPageRequested: (_) => _onNextPageRequested(emit),
        onMessagesUpdated: (_EventOnMessagesUpdated event) => _onMessagesUpdated(event, emit),
        effectHandled: (_) => _onEffectHandled(emit),
      ),
    );

    _chatMessagesStreamSubscription = _chatRepository.subscribeEvents(_chatMessagesStreamListener);
  }

  final ChatRepository _chatRepository;
  final BlocErrorHandler _blocErrorHandler;

  late ChatMessagesSubscription _chatMessagesStreamSubscription;

  @override
  Future<void> close() async {
    await _chatMessagesStreamSubscription.cancel();
    return super.close();
  }

  void _onEffectHandled(Emitter<ReadingViewState> emit) {
    emit(state.copyWith(effect: null));
  }

  void _chatMessagesStreamListener(Iterable<Message> messages) {
    if (isClosed) return;
    add(ReadingViewEvent.onMessagesUpdated(messages: _mergeMessages(state.messages, messages)));
  }

  Iterable<Message> _mergeMessages(Iterable<Message> oldMessages, Iterable<Message> newMessages) {
    final List<Message> updatedMessages = <Message>[];
    final Iterator<Message> oldIter = oldMessages.iterator;
    final Iterator<Message> newIter = newMessages.iterator;

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
        updatedMessages.add(newIter.current);
        hasOld = oldIter.moveNext();
        hasNew = newIter.moveNext();
      } else if (oldIter.current.createdAt.isBefore(newIter.current.createdAt)) {
        updatedMessages.add(oldIter.current);
        hasOld = oldIter.moveNext();
      } else {
        updatedMessages.add(newIter.current);
        hasNew = newIter.moveNext();
      }
    }

    return updatedMessages;
  }

  void _onMessagesUpdated(_EventOnMessagesUpdated event, Emitter<ReadingViewState> emit) {
    emit(state.copyWith(messages: event.messages, isPending: false));
  }

  Future<void> _onNextPageRequested(Emitter<ReadingViewState> emit) async {
    try {
      // await _chatRepository.fetchNextMessages();
    } on Object catch (error, stackTrace) {
      final ErrorPresentation presentation = _blocErrorHandler.handle(
        error,
        stackTrace: stackTrace,
      );
      if (presentation.shouldRethrow) rethrow;
    }
  }
}
