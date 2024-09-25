import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:quectochat/domain/models/chat_message_type.dart';

import '../../domain/interfaces/i_api_facade.dart';
import '../../domain/interfaces/i_chat_repository.dart';
import '../../domain/models/chat_message.dart';
import '../../domain/utils/id_tools/id_tools.dart';

@Singleton(as: IChatRepository)
final class ChatRepository implements IChatRepository {
  ChatRepository({
    required INetworkFacade networkFacade,
  }) : _networkFacade = networkFacade {
    _messagesStreamController =
        StreamController<Iterable<ChatMessage>>.broadcast();
    _errorsStreamController = StreamController<ChatRepositoryError>.broadcast();

    _messages = [];
    _partnerId = '';
  }

  // СОСТОЯНИЕ:
  // ---------------------------------------------------------------------------
  StreamSubscription<ChatMessage>? _chatStreamSubscription;
  late Iterable<ChatMessage> _messages;
  late String _currentUserId;
  late String _partnerId;
  late String _chatId;

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
    _currentUserId = _networkFacade.currentUserId;
    if (_currentUserId.isEmpty) {
      throw UnsupportedError('Current user id is expected in ChatRepository');
    }

    _partnerId = toId;
    if (_partnerId.isEmpty) {
      throw UnsupportedError('Chat partner id is expected in ChatRepository');
    }

    _chatId = IdTools.getChatId([_currentUserId, _partnerId]);

    try {
      // Подписываемся на стрим новых сообщений в чате
      _chatStreamSubscription =
          _networkFacade.getChatStream(chatId: _chatId).listen(
                _onChatStreamMessageReceived,
                onError: _onChatStreamErrorReceived,
              );

      // Тянем первую страницу с сообщениями
      _messages = await _networkFacade.getChatMessages(chatId: _chatId);
      _emitMessages();
    } on Object {
      _emitError();
      rethrow;
    }
  }

  /// Очистка данных при закрытии чата
  @override
  Future<void> cleanup() async {
    await _chatStreamSubscription?.cancel();
    _messages = [];
    _partnerId = '';
    _chatId = '';
  }

  /// Получение следующей страницы с сообщениями
  @override
  Future<void> fetchNextMessages() async {
    try {
      _messages = await _networkFacade.getChatMessages(
        chatId: _chatId,
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
    try {
      final message = ChatMessage(
        fromId: _currentUserId,
        toId: _partnerId,
        createdAt: DateTime.now(),
        content: content,
        type: type,
        isOwn: true,
      );

      await _networkFacade.sendMessage(message: message, chatId: _chatId);
    } on Object {
      _emitError();
      rethrow;
    }
  }

  // ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ:
  // ---------------------------------------------------------------------------
  /// Эмитирует свежий список сообщений подписчикам
  void _emitMessages() {
    if (_messagesStreamController.isClosed) return;
    _messagesStreamController.add(_messages);
  }

  /// Эмитирует ошибки подписчикам
  void _emitError({ChatRepositoryError? error}) {
    if (_errorsStreamController.isClosed) return;
    _errorsStreamController.add(error ?? const ChatRepositoryError());
  }

  /// Обработчик событий в стриме чата
  void _onChatStreamMessageReceived(ChatMessage message) {
    _messages = _messages.followedBy([message]);

    if (_messagesStreamController.isClosed) return;
    _messagesStreamController.add(_messages);
  }

  /// Обработчик ошибок в стриме чата
  void _onChatStreamErrorReceived(Object error, StackTrace stackTrace) {
    Error.throwWithStackTrace(error, stackTrace);
  }
}
