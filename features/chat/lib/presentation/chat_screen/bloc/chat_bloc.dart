import 'dart:async';

import 'package:chat/domain/repositories/chat_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_core/core.dart';

part 'chat_bloc.freezed.dart';
part 'chat_effect.dart';
part 'chat_event.dart';
part 'chat_state.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  @factoryMethod
  ChatBloc(
    this._chatRepository,
    this._blocErrorHandler, {
    @factoryParam required String interlocutorId,
  }) : super(_initialState(interlocutorId: interlocutorId)) {
    on<ChatEvent>(
      (ChatEvent event, Emitter<ChatState> emit) => event.map(
        onInitializationRequested: (_) => _onInitializationRequested(emit),
        onErrorReceived: (_EventOnErrorReceived event) => _onErrorReceived(event, emit),
        effectHandled: (_) => _onEffectHandled(emit),
      ),
    );

    _chatErrorsStreamSubscription = _chatRepository.subscribeErrors(_chatErrorsStreamListener);
    add(const ChatEvent.onInitializationRequested());
  }

  final ChatRepository _chatRepository;
  final BlocErrorHandler _blocErrorHandler;

  late ChatErrorsSubscription _chatErrorsStreamSubscription;

  static ChatState _initialState({required String interlocutorId}) =>
      ChatState(interlocutorId: interlocutorId);

  void _chatErrorsStreamListener(ChatRepositoryError error) {
    if (isClosed) return;
    add(ChatEvent.onErrorReceived(error: error));
  }

  @override
  Future<void> close() async {
    await _chatRepository.cleanup();
    await _chatErrorsStreamSubscription.cancel();
    return super.close();
  }

  void _onEffectHandled(Emitter<ChatState> emit) {
    emit(state.copyWith(effect: null));
  }

  Future<void> _onInitializationRequested(Emitter<ChatState> emit) async {
    try {
      await _chatRepository.initialize(interlocutorId: state.interlocutorId);
      unawaited(_chatRepository.markAsRead(interlocutorId: state.interlocutorId));
    } on Object catch (error, stackTrace) {
      final ErrorPresentation presentation = _blocErrorHandler.handle(
        error,
        stackTrace: stackTrace,
      );
      if (presentation.shouldRethrow) rethrow;
    }
  }

  void _onErrorReceived(_EventOnErrorReceived event, Emitter<ChatState> emit) {
    emit(state.copyWith(effect: ChatEffect.showError(kind: _mapChatRepositoryError(event.error))));
  }

  AppErrorKind _mapChatRepositoryError(ChatRepositoryError error) => switch (error) {
    ChatLoadMessagesFailure() => AppErrorKind.generic,
    ChatSendMessageFailure() => AppErrorKind.generic,
    ChatMarkAsReadFailure() => AppErrorKind.generic,
    ChatRepositoryGenericFailure() => AppErrorKind.generic,
  };
}
