import 'dart:async';

import 'package:quectochat/domain/models/chat_message_type.dart';

import '../../domain/interfaces/i_api_facade.dart';
import '../../domain/interfaces/i_chat_repository.dart';
import '../../domain/models/chat_message.dart';

final class ChatRepository implements IChatRepository {
  ChatRepository({
    required INetworkFacade networkFacade,
  }) : _networkFacade = networkFacade {
    _messagesStreamController =
        StreamController<Iterable<ChatMessage>>.broadcast();
    _errorsStreamController = StreamController<ChatRepositoryError>.broadcast();

    _messages = [];
    _toId = '';
  }

  // СОСТОЯНИЕ:
  // ---------------------------------------------------------------------------
  late Iterable<ChatMessage> _messages;
  late String _toId;

  // ЗАВИСИМОСТИ:
  // ---------------------------------------------------------------------------
  final INetworkFacade _networkFacade;

  // СТРИМЫ:
  // ---------------------------------------------------------------------------
  late final StreamController<Iterable<ChatMessage>> _messagesStreamController;
  late final StreamController<ChatRepositoryError> _errorsStreamController;

  /// подписка на изменения данных в репозитории
  @override
  ChatMessagesSubscription subscribeEvents(
    Function(Iterable<ChatMessage>) listener,
  ) {
    return _messagesStreamController.stream.listen(listener);
  }

  /// подписка на ошибки в репозитории
  @override
  ChatErrorsSubscription subscribeErrors(
    Function(ChatRepositoryError) listener,
  ) {
    return _errorsStreamController.stream.listen(listener);
  }

  @override
  Future<void> close() async {
    await _messagesStreamController.close();
    await _errorsStreamController.close();
  }

  // МЕТОДЫ:
  // ---------------------------------------------------------------------------
  /// Инициализация данных при открытии чата
  @override
  Future<void> initialize({required String toId}) async {
    _toId = toId;
    try {
      _messages = await _networkFacade.getChatMessages(toId: _toId);
      _emitMessages();
    } on Object {
      _emitError();
      rethrow;
    }
  }

  /// Очистка данных при закрытии чата
  @override
  Future<void> cleanup() async {
    _messages = [];
    _toId = '';
  }

  /// Получение следующей страницы с сообщениями
  @override
  Future<void> fetchNextMessages() async {
    try {
      _messages = await _networkFacade.getChatMessages(
        toId: _toId,
        isNext: true,
      );
      _emitMessages();
    } on Object {
      _emitError();
      rethrow;
    }
  }

  @override
  Future<void> sendMessage({
    required String content,
    required ChatMessageType type,
  }) async {
    final currentUserId = _networkFacade.currentUserId;
    if (currentUserId == null) return;

    try {
      final message = ChatMessage(
        fromId: currentUserId,
        toId: _toId,
        createdAt: DateTime.now(),
        content: content,
        type: type,
        isOwn: true,
      );

      await _networkFacade.sendMessage(message: message);
    } on Object {
      _emitError();
      rethrow;
    }
  }

  // ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ:
  // ---------------------------------------------------------------------------
  void _emitMessages() {
    if (_messagesStreamController.isClosed) return;
    _messagesStreamController.add(_messages);
  }

  void _emitError({ChatRepositoryError? error}) {
    if (_errorsStreamController.isClosed) return;
    _errorsStreamController.add(error ?? const ChatRepositoryError());
  }
}
