import 'dart:async';

import 'package:chat/data/datasources/chat_remote_data_source.dart';
import 'package:chat/data/dto/message_dto.dart';
import 'package:chat/data/mappers/message_mapper.dart';
import 'package:chat/domain/entities/message.dart';
import 'package:chat/domain/repositories/chat_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';

@LazySingleton(as: ChatRepository)
final class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl({
    required ChatRemoteDataSource remoteDataSource,
    required CurrentUserPort currentUserPort,
  }) : _remoteDataSource = remoteDataSource,
       _currentUserPort = currentUserPort;

  StreamSubscription<Set<MessageDto>>? _chatStreamSubscription;
  Timer? _activeChatHeartbeatTimer;

  final ChatRemoteDataSource _remoteDataSource;
  final CurrentUserPort _currentUserPort;
  final StreamController<Set<Message>> _messagesStreamController =
      StreamController<Set<Message>>.broadcast();
  final StreamController<ChatRepositoryError> _errorsStreamController =
      StreamController<ChatRepositoryError>.broadcast();

  String? _activeInterlocutorId;

  static const Duration _activeChatHeartbeatInterval = Duration(seconds: 10);

  String get _currentUserId => _currentUserPort.currentUserId;

  @override
  ChatMessagesSubscription subscribeEvents(void Function(Iterable<Message>) listener) {
    return _messagesStreamController.stream.listen(listener);
  }

  @override
  ChatErrorsSubscription subscribeErrors(void Function(ChatRepositoryError) listener) {
    return _errorsStreamController.stream.listen(listener);
  }

  @override
  ChatTypingSubscription subscribeInterlocutorTyping(void Function(bool isTyping) listener) {
    return _remoteDataSource.typingStatusStream.listen(listener);
  }

  @override
  Future<void> close() async {
    await _messagesStreamController.close();
    await _errorsStreamController.close();
  }

  @override
  Future<void> initialize({required String interlocutorId}) async {
    _activeInterlocutorId = interlocutorId;
    _chatStreamSubscription = _remoteDataSource
        .getAddedModifiedMessagesStream(interlocutorId: interlocutorId)
        .listen(_onChatStreamMessageReceived, onError: _onChatStreamErrorReceived);
    await _remoteDataSource.startTypingChannel(interlocutorId: interlocutorId);
    await _startActiveChatHeartbeat(interlocutorId: interlocutorId);
  }

  @override
  Future<void> cleanup() async {
    _activeInterlocutorId = null;
    await _stopActiveChatHeartbeat();
    await _remoteDataSource.stopTypingChannel();
    await _chatStreamSubscription?.cancel();
  }

  @override
  Future<void> markAsRead({required String interlocutorId}) async {
    try {
      await _remoteDataSource.markAsRead(interlocutorId: interlocutorId);
    } on Object {
      _emitError(const ChatMarkAsReadFailure());
      rethrow;
    }
  }

  @override
  Future<void> setTypingStatus({required bool isTyping}) async {
    try {
      await _remoteDataSource.sendTypingStatus(isTyping: isTyping);
    } on Object catch (error, stackTrace) {
      logInfrastructureFailure(
        'Failed to set typing status',
        name: 'ChatRepository',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> startDeliveryTracking() async {
    try {
      await _remoteDataSource.startIncomingMessagesWatcher();
    } on Object catch (error, stackTrace) {
      logInfrastructureFailure(
        'Failed to start delivery tracking',
        name: 'ChatRepository',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> stopDeliveryTracking() async {
    try {
      await _remoteDataSource.stopIncomingMessagesWatcher();
    } on Object catch (error, stackTrace) {
      logInfrastructureFailure(
        'Failed to stop delivery tracking',
        name: 'ChatRepository',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<Paginated<Message>> getChatMessages({
    required String interlocutorId,
    String? lastMessageId,
  }) async {
    try {
      final Paginated<MessageDto> paginated = await _remoteDataSource.getChatMessages(
        interlocutorId: interlocutorId,
        lastMessageId: lastMessageId,
      );

      return Paginated<Message>(
        hasNext: paginated.hasNext,
        result: paginated.result.map(
          (MessageDto dto) => mapMessageDtoToDomain(dto: dto, currentUserId: _currentUserId),
        ),
      );
    } on Object {
      _emitError(const ChatLoadMessagesFailure());
      rethrow;
    }
  }

  @override
  Future<void> sendMessage({
    required String interlocutorId,
    required String content,
    required MessageContentType type,
  }) async {
    try {
      final MessageDto messageDto = await _remoteDataSource.sendMessage(
        interlocutorId: interlocutorId,
        content: content,
        messageType: mapMessageContentTypeToTransport(type),
      );
      _emitMessage(mapMessageDtoToDomain(dto: messageDto, currentUserId: _currentUserId));
    } on Object {
      _emitError(const ChatSendMessageFailure());
      rethrow;
    }
  }

  void _emitMessage(Message message) {
    if (_messagesStreamController.isClosed) return;
    _messagesStreamController.add(<Message>{message});
  }

  void _emitError(ChatRepositoryError error) {
    if (_errorsStreamController.isClosed) return;
    _errorsStreamController.add(error);
  }

  void _onChatStreamMessageReceived(Set<MessageDto> messages) {
    if (_messagesStreamController.isClosed) return;
    _messagesStreamController.add(
      messages
          .map((MessageDto dto) => mapMessageDtoToDomain(dto: dto, currentUserId: _currentUserId))
          .toSet(),
    );

    final String? interlocutorId = _activeInterlocutorId;
    if (interlocutorId == null) return;

    final bool hasUnreadIncoming = messages.any(
      (MessageDto dto) =>
          dto.fromId == interlocutorId && dto.toId == _currentUserId && dto.readAt == null,
    );
    if (hasUnreadIncoming) {
      unawaited(_markAsReadSilently(interlocutorId: interlocutorId));
    }
  }

  Future<void> _markAsReadSilently({required String interlocutorId}) async {
    try {
      await _remoteDataSource.markAsRead(interlocutorId: interlocutorId);
    } on Object catch (error, stackTrace) {
      logInfrastructureFailure(
        'Failed to mark messages as read while chat is open',
        name: 'ChatRepository',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  void _onChatStreamErrorReceived(Object error, StackTrace stackTrace) {
    _emitError(const ChatRepositoryGenericFailure());
    Error.throwWithStackTrace(error, stackTrace);
  }

  Future<void> _startActiveChatHeartbeat({required String interlocutorId}) async {
    await _stopActiveChatHeartbeat(clearRemote: false);
    await _markChatActiveSafely(interlocutorId: interlocutorId);
    _activeChatHeartbeatTimer = Timer.periodic(_activeChatHeartbeatInterval, (_) {
      unawaited(_markChatActiveSafely(interlocutorId: interlocutorId));
    });
  }

  Future<void> _stopActiveChatHeartbeat({bool clearRemote = true}) async {
    _activeChatHeartbeatTimer?.cancel();
    _activeChatHeartbeatTimer = null;
    if (!clearRemote) return;
    try {
      await _remoteDataSource.clearActiveChat();
    } on Object catch (error, stackTrace) {
      logInfrastructureFailure(
        'Failed to clear active chat',
        name: 'ChatRepository',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _markChatActiveSafely({required String interlocutorId}) async {
    try {
      await _remoteDataSource.markChatActive(interlocutorId: interlocutorId);
    } on Object catch (error, stackTrace) {
      logInfrastructureFailure(
        'Failed to mark chat active',
        name: 'ChatRepository',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}
