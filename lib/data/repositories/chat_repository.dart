import 'dart:async';

import '../../domain/interfaces/i_api_facade.dart';
import '../../domain/interfaces/i_chat_repository.dart';
import '../../domain/models/message.dart';
import '../../domain/models/message_content_type.dart';
import '../../domain/models/paginated.dart';

final class ChatRepository implements IChatRepository {
  ChatRepository({
    required INetworkFacade networkFacade,
  }) : _networkFacade = networkFacade {
    _messagesStreamController = StreamController<Set<Message>>.broadcast();
    _errorsStreamController = StreamController<ChatRepositoryError>.broadcast();
  }

  // СОСТОЯНИЕ:
  // ---------------------------------------------------------------------------
  StreamSubscription<Set<Message>>? _chatStreamSubscription;

  // ЗАВИСИМОСТИ:
  // ---------------------------------------------------------------------------
  final INetworkFacade _networkFacade;

  // СТРИМЫ:
  // ---------------------------------------------------------------------------
  late final StreamController<Set<Message>> _messagesStreamController;
  late final StreamController<ChatRepositoryError> _errorsStreamController;

  // ---------------------------------------------------------------------------
  @override
  ChatMessagesSubscription subscribeEvents(
    Function(Iterable<Message>) listener,
  ) {
    return _messagesStreamController.stream.listen(listener);
  }

  // ---------------------------------------------------------------------------
  @override
  ChatErrorsSubscription subscribeErrors(
    Function(ChatRepositoryError) listener,
  ) {
    return _errorsStreamController.stream.listen(listener);
  }

  // ---------------------------------------------------------------------------
  @override
  Future<void> close() async {
    await _messagesStreamController.close();
    await _errorsStreamController.close();
  }

  // МЕТОДЫ:
  // ---------------------------------------------------------------------------
  @override
  Future<void> initialize({required String interlocutorId}) async {
    _chatStreamSubscription = _networkFacade
        .getAddedModifiedMessagesStream(interlocutorId: interlocutorId)
        .listen(
          _onChatStreamMessageReceived,
          onError: _onChatStreamErrorReceived,
        );
  }

  // ---------------------------------------------------------------------------
  @override
  Future<void> cleanup() async {
    await _chatStreamSubscription?.cancel();
  }

  // ---------------------------------------------------------------------------
  @override
  Future<void> markAsViewed({required String interlocutorId}) async {
    try {
      await _networkFacade.markAsViewed(interlocutorId: interlocutorId);
    } on Object {
      _emitError();
      rethrow;
    }
  }

  // ---------------------------------------------------------------------------
  @override
  Future<Paginated<Message>> getChatMessages({
    required String interlocutorId,
    String? lastMessageId,
  }) async {
    try {
      final messages = await _networkFacade.getChatMessages(
        interlocutorId: interlocutorId,
        lastMessageId: lastMessageId,
      );
      return messages;
    } on Object {
      _emitError();
      rethrow;
    }
  }

  // ---------------------------------------------------------------------------
  @override
  Future<void> sendMessage({
    required String interlocutorId,
    required String content,
    required MessageContentType type,
  }) async {
    try {
      final message = await _networkFacade.sendMessage(
        interlocutorId: interlocutorId,
        content: content,
        type: type,
      );
      _emitMessage(message);
    } on Object {
      _emitError();
      rethrow;
    }
  }

  // ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ:
  // ---------------------------------------------------------------------------
  /// Эмитирует свежий список сообщений подписчикам
  void _emitMessage(Message message) {
    if (_messagesStreamController.isClosed) return;
    _messagesStreamController.add({message});
  }

  /// Эмитирует ошибки подписчикам
  void _emitError({ChatRepositoryError? error}) {
    if (_errorsStreamController.isClosed) return;
    _errorsStreamController.add(error ?? const ChatRepositoryError());
  }

  /// Обработчик событий в стриме чата
  void _onChatStreamMessageReceived(Set<Message> messages) {
    if (_messagesStreamController.isClosed) return;
    _messagesStreamController.add(messages);
  }

  /// Обработчик ошибок в стриме чата
  void _onChatStreamErrorReceived(Object error, StackTrace stackTrace) {
    Error.throwWithStackTrace(error, stackTrace);
  }
}
