import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:chat/domain/repositories/chat_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';

part 'typing_view_bloc.freezed.dart';
part 'typing_view_event.dart';
part 'typing_view_state.dart';

@injectable
class TypingViewBloc extends Bloc<TypingViewEvent, TypingViewState> {
  @factoryMethod
  TypingViewBloc(
    this._chatRepository,
    this._blocErrorHandler, {
    @factoryParam required String interlocutorId,
  }) : super(_initialState(interlocutorId: interlocutorId)) {
    on<TypingViewEvent>((TypingViewEvent event, Emitter<TypingViewState> emit) {
      if (event is _EventOnSendTapped) return;
      event.map(
        onMessageChanged: (_EventOnMessageChanged event) => _onMessageChanged(event, emit),
        onSendTapped: (_) {},
      );
    });
    on<_EventOnSendTapped>(_onSendTapped, transformer: droppable());
  }

  final ChatRepository _chatRepository;
  final BlocErrorHandler _blocErrorHandler;

  static TypingViewState _initialState({required String interlocutorId}) =>
      TypingViewState(interlocutorId: interlocutorId);

  void _onMessageChanged(_EventOnMessageChanged event, Emitter<TypingViewState> emit) {
    emit(state.copyWith(typedMessage: event.val));
  }

  Future<void> _onSendTapped(_EventOnSendTapped event, Emitter<TypingViewState> emit) async {
    if (state.typedMessage.trim().isEmpty || state.isSending) return;

    emit(state.copyWith(isSending: true));

    try {
      await _chatRepository.sendMessage(
        interlocutorId: state.interlocutorId,
        content: state.typedMessage,
        type: MessageContentType.text,
      );
      emit(state.copyWith(typedMessage: ''));
    } on Object catch (error, stackTrace) {
      final ErrorPresentation presentation = _blocErrorHandler.handle(
        error,
        stackTrace: stackTrace,
      );
      if (presentation.shouldRethrow) rethrow;
    } finally {
      emit(state.copyWith(isSending: false));
    }
  }
}
