import 'package:chat/domain/entities/message.dart';
import 'package:chat/domain/repositories/chat_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';

part 'reading_view_bloc.freezed.dart';
part 'reading_view_event.dart';
part 'reading_view_state.dart';

@injectable
class ReadingViewBloc extends Bloc<ReadingViewEvent, ReadingViewState> {
  @factoryMethod
  ReadingViewBloc(
    this._chatRepository,
    this._blocErrorHandler, {
    @factoryParam required String interlocutorId,
  }) : super(ReadingViewState(interlocutorId: interlocutorId)) {
    on<ReadingViewEvent>(
      (ReadingViewEvent event, Emitter<ReadingViewState> emit) => event.map(
        onInitializationRequested: (_) => _onInitializationRequested(emit),
        onNextPageRequested: (_) => _onNextPageRequested(emit),
        onMessagesUpdated: (_EventOnMessagesUpdated event) => _onMessagesUpdated(event, emit),
        onChatCleared: (_) => _onChatCleared(emit),
      ),
    );

    _chatMessagesStreamSubscription = _chatRepository.subscribeEvents(_chatMessagesStreamListener);
    _chatClearedSubscription = _chatRepository.subscribeChatCleared(_chatClearedListener);
    add(const ReadingViewEvent.onInitializationRequested());
  }

  final ChatRepository _chatRepository;
  final BlocErrorHandler _blocErrorHandler;

  late final ChatMessagesSubscription _chatMessagesStreamSubscription;
  late final ChatClearedSubscription _chatClearedSubscription;

  @override
  Future<void> close() async {
    await _chatMessagesStreamSubscription.cancel();
    await _chatClearedSubscription.cancel();
    return super.close();
  }

  void _chatMessagesStreamListener(Iterable<Message> messages) {
    if (isClosed) return;
    add(ReadingViewEvent.onMessagesUpdated(messages: _mergeMessages(state.messages, messages)));
  }

  void _chatClearedListener() {
    if (isClosed) return;
    add(const ReadingViewEvent.onChatCleared());
  }

  List<Message> _mergeMessages(List<Message> oldMessages, Iterable<Message> newMessages) {
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

  void _onChatCleared(Emitter<ReadingViewState> emit) {
    emit(state.copyWith(messages: <Message>[], hasNext: false, isPending: false));
  }

  Future<void> _onInitializationRequested(Emitter<ReadingViewState> emit) async {
    emit(state.copyWith(isPending: true));
    try {
      final Paginated<Message> page = await _chatRepository.getChatMessages(
        interlocutorId: state.interlocutorId,
      );
      emit(state.copyWith(messages: page.result.toList(), hasNext: page.hasNext, isPending: false));
    } on Object catch (error, stackTrace) {
      final ErrorPresentation presentation = _blocErrorHandler.handle(
        error,
        stackTrace: stackTrace,
      );
      emit(state.copyWith(isPending: false));
      if (presentation.shouldRethrow) rethrow;
    }
  }

  Future<void> _onNextPageRequested(Emitter<ReadingViewState> emit) async {
    if (!state.hasNext || state.isNextLoading || state.messages.isEmpty) return;

    emit(state.copyWith(isNextLoading: true));
    try {
      final Paginated<Message> page = await _chatRepository.getChatMessages(
        interlocutorId: state.interlocutorId,
        lastMessageId: state.messages.first.id,
      );
      emit(
        state.copyWith(
          messages: page.result.followedBy(state.messages).toList(),
          hasNext: page.hasNext,
          isNextLoading: false,
        ),
      );
    } on Object catch (error, stackTrace) {
      final ErrorPresentation presentation = _blocErrorHandler.handle(
        error,
        stackTrace: stackTrace,
      );
      emit(state.copyWith(isNextLoading: false));
      if (presentation.shouldRethrow) rethrow;
    }
  }
}
