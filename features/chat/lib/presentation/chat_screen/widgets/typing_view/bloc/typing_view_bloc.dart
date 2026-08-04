import 'dart:async';

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
      if (event is _EventOnSendTapped || event is _EventOnImagePicked) return;
      event.map(
        onMessageChanged: (_EventOnMessageChanged event) => _onMessageChanged(event, emit),
        onSendTapped: (_) {},
        onImagePicked: (_) {},
      );
    });
    on<_EventOnSendTapped>(_onSendTapped, transformer: droppable());
    on<_EventOnImagePicked>(_onImagePicked, transformer: droppable());
  }

  final ChatRepository _chatRepository;
  final BlocErrorHandler _blocErrorHandler;

  static const Duration _typingIdleTimeout = Duration(seconds: 3);

  Timer? _typingIdleTimer;
  bool _isTypingActive = false;

  static TypingViewState _initialState({required String interlocutorId}) =>
      TypingViewState(interlocutorId: interlocutorId);

  @override
  Future<void> close() async {
    _typingIdleTimer?.cancel();
    if (_isTypingActive) {
      _isTypingActive = false;
      unawaited(_chatRepository.setTypingStatus(isTyping: false));
    }
    return super.close();
  }

  void _onMessageChanged(_EventOnMessageChanged event, Emitter<TypingViewState> emit) {
    emit(state.copyWith(typedMessage: event.val));
    _restartTypingIdleTimer();
  }

  /// Resets the 3s idle window on every keystroke; sends "typing" only once
  /// per active burst, and "not typing" once the burst goes quiet.
  void _restartTypingIdleTimer() {
    _typingIdleTimer?.cancel();

    if (!_isTypingActive) {
      _isTypingActive = true;
      unawaited(_chatRepository.setTypingStatus(isTyping: true));
    }

    _typingIdleTimer = Timer(_typingIdleTimeout, _onTypingIdleTimeout);
  }

  void _onTypingIdleTimeout() {
    _isTypingActive = false;
    unawaited(_chatRepository.setTypingStatus(isTyping: false));
  }

  Future<void> _onSendTapped(_EventOnSendTapped event, Emitter<TypingViewState> emit) async {
    final String text = event.text.trim();
    if (text.isEmpty || state.isSending) return;

    emit(state.copyWith(isSending: true, typedMessage: ''));

    try {
      await _chatRepository.sendMessage(
        interlocutorId: state.interlocutorId,
        content: text,
        type: MessageContentType.text,
      );
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

  Future<void> _onImagePicked(_EventOnImagePicked event, Emitter<TypingViewState> emit) async {
    if (state.isSending || event.filePath.isEmpty) return;

    emit(state.copyWith(isSending: true));

    try {
      await _chatRepository.sendImageMessage(
        interlocutorId: state.interlocutorId,
        filePath: event.filePath,
      );
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
