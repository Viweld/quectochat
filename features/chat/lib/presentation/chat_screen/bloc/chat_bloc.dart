import 'dart:async';

import 'package:chat/domain/entities/interlocutor_status.dart';
import 'package:chat/domain/repositories/chat_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navigation_api/navigation_api.dart';
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
    this._presencePort,
    this._blocErrorHandler, {
    @factoryParam required String interlocutorId,
  }) : super(_initialState(interlocutorId: interlocutorId)) {
    on<ChatEvent>(
      (ChatEvent event, Emitter<ChatState> emit) => event.map(
        onInitializationRequested: (_) => _onInitializationRequested(emit),
        onErrorReceived: (_EventOnErrorReceived event) => _onErrorReceived(event, emit),
        onStatusRecomputeRequested: (_) => _onStatusRecomputeRequested(emit),
        onAppPaused: (_) => _onAppPaused(),
        onAppResumed: (_) => _onAppResumed(),
        onClearChatRequested: (_) => _onClearChatRequested(emit),
        effectHandled: (_) => _onEffectHandled(emit),
      ),
    );

    _chatErrorsStreamSubscription = _chatRepository.subscribeErrors(_chatErrorsStreamListener);
    _onlineUserIdsSubscription = _presencePort.onlineUserIdsStream.listen(_onOnlineUserIdsChanged);
    _lastSeenSubscription = _presencePort
        .watchLastSeenAt(interlocutorId)
        .listen(_onLastSeenAtChanged);
    _typingSubscription = _chatRepository.subscribeInterlocutorTyping(_onTypingChanged);
    _statusTimer = Timer.periodic(_statusTickInterval, (_) {
      if (isClosed) return;
      add(const ChatEvent.onStatusRecomputeRequested());
    });

    add(const ChatEvent.onInitializationRequested());
  }

  final ChatRepository _chatRepository;
  final PresencePort _presencePort;
  final BlocErrorHandler _blocErrorHandler;

  late final ChatErrorsSubscription _chatErrorsStreamSubscription;
  late final StreamSubscription<Set<String>> _onlineUserIdsSubscription;
  late final StreamSubscription<DateTime?> _lastSeenSubscription;
  late final ChatTypingSubscription _typingSubscription;
  late final Timer _statusTimer;
  Timer? _typingTimeoutTimer;

  bool _isOnline = false;
  bool _isTyping = false;
  DateTime? _lastSeenAt;
  bool _hasPresenceSnapshot = false;
  bool _hasLastSeenSnapshot = false;

  static const Duration _recentlyOfflineThreshold = Duration(minutes: 5);
  static const Duration _typingTimeout = Duration(seconds: 6);
  static const Duration _statusTickInterval = Duration(seconds: 15);

  static ChatState _initialState({required String interlocutorId}) =>
      ChatState(interlocutorId: interlocutorId);

  void _chatErrorsStreamListener(ChatRepositoryError error) {
    if (isClosed) return;
    add(ChatEvent.onErrorReceived(error: error));
  }

  void _onOnlineUserIdsChanged(Set<String> onlineUserIds) {
    _hasPresenceSnapshot = true;
    _isOnline = onlineUserIds.contains(state.interlocutorId);
    if (isClosed) return;
    add(const ChatEvent.onStatusRecomputeRequested());
  }

  void _onLastSeenAtChanged(DateTime? lastSeenAt) {
    _hasLastSeenSnapshot = true;
    _lastSeenAt = lastSeenAt;
    if (isClosed) return;
    add(const ChatEvent.onStatusRecomputeRequested());
  }

  void _onTypingChanged(bool isTyping) {
    _isTyping = isTyping;
    _typingTimeoutTimer?.cancel();
    if (isTyping) {
      _typingTimeoutTimer = Timer(_typingTimeout, () {
        if (isClosed) return;
        _isTyping = false;
        add(const ChatEvent.onStatusRecomputeRequested());
      });
    } else {
      _typingTimeoutTimer = null;
    }
    if (isClosed) return;
    add(const ChatEvent.onStatusRecomputeRequested());
  }

  @override
  Future<void> close() async {
    _statusTimer.cancel();
    _typingTimeoutTimer?.cancel();
    await _chatRepository.cleanup();
    await _chatErrorsStreamSubscription.cancel();
    await _onlineUserIdsSubscription.cancel();
    await _lastSeenSubscription.cancel();
    await _typingSubscription.cancel();
    return super.close();
  }

  void _onEffectHandled(Emitter<ChatState> emit) {
    emit(state.copyWith(effect: null));
  }

  Future<void> _onAppPaused() async {
    await _chatRepository.pauseActiveChatPresence();
  }

  Future<void> _onAppResumed() async {
    await _chatRepository.resumeActiveChatPresence();
  }

  Future<void> _onClearChatRequested(Emitter<ChatState> emit) async {
    try {
      await _chatRepository.clearChat(interlocutorId: state.interlocutorId);
    } on Object catch (error, stackTrace) {
      final ErrorPresentation presentation = _blocErrorHandler.handle(
        error,
        stackTrace: stackTrace,
      );
      if (presentation.shouldRethrow) rethrow;
    }
  }

  Future<void> _onInitializationRequested(Emitter<ChatState> emit) async {
    try {
      await _chatRepository.initialize(interlocutorId: state.interlocutorId);
      unawaited(_chatRepository.markAsRead(interlocutorId: state.interlocutorId));
      _emitComputedStatus(emit);
    } on Object catch (error, stackTrace) {
      final ErrorPresentation presentation = _blocErrorHandler.handle(
        error,
        stackTrace: stackTrace,
      );
      if (presentation.shouldRethrow) rethrow;
    }
  }

  void _onStatusRecomputeRequested(Emitter<ChatState> emit) {
    _emitComputedStatus(emit);
  }

  void _emitComputedStatus(Emitter<ChatState> emit) {
    final InterlocutorStatus? next = _computeStatus();
    if (next == state.interlocutorStatus) return;
    emit(state.copyWith(interlocutorStatus: next));
  }

  InterlocutorStatus? _computeStatus() {
    if (_isTyping) return InterlocutorStatus.typing;

    // Prefer live presence; fall back to last-seen only when roster is known.
    if (_hasPresenceSnapshot) {
      if (_isOnline) return InterlocutorStatus.online;
      final DateTime? lastSeenAt = _lastSeenAt;
      if (lastSeenAt == null) return InterlocutorStatus.longOffline;
      if (DateTime.now().toUtc().difference(lastSeenAt) <= _recentlyOfflineThreshold) {
        return InterlocutorStatus.recentlyOffline;
      }
      return InterlocutorStatus.longOffline;
    }

    if (!_hasLastSeenSnapshot) return null;

    final DateTime? lastSeenAt = _lastSeenAt;
    if (lastSeenAt == null) return InterlocutorStatus.longOffline;
    if (DateTime.now().toUtc().difference(lastSeenAt) <= _recentlyOfflineThreshold) {
      return InterlocutorStatus.recentlyOffline;
    }
    return InterlocutorStatus.longOffline;
  }

  void _onErrorReceived(_EventOnErrorReceived event, Emitter<ChatState> emit) {
    emit(state.copyWith(effect: ChatEffect.showError(kind: _mapChatRepositoryError(event.error))));
  }

  AppErrorKind _mapChatRepositoryError(ChatRepositoryError error) => switch (error) {
    ChatLoadMessagesFailure() => AppErrorKind.generic,
    ChatSendMessageFailure() => AppErrorKind.generic,
    ChatMarkAsReadFailure() => AppErrorKind.generic,
    ChatClearChatFailure() => AppErrorKind.generic,
    ChatRepositoryGenericFailure() => AppErrorKind.generic,
  };
}
