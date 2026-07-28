import 'dart:async';

import 'package:chat/data/datasources/chat_remote_data_source.dart';
import 'package:chat/data/dto/message_dto.dart';
import 'package:chat/data/mappers/message_mapper.dart';
import 'package:chat/domain/entities/message.dart';
import 'package:chat/domain/repositories/chat_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_domain/shared_domain.dart';

@LazySingleton(as: ChatRepository)
final class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl({
    required ChatRemoteDataSource remoteDataSource,
    required CurrentUserPort currentUserPort,
  }) : _remoteDataSource = remoteDataSource,
       _currentUserPort = currentUserPort;

  StreamSubscription<Set<MessageDto>>? _chatStreamSubscription;

  final ChatRemoteDataSource _remoteDataSource;
  final CurrentUserPort _currentUserPort;
  final StreamController<Set<Message>> _messagesStreamController =
      StreamController<Set<Message>>.broadcast();
  final StreamController<ChatRepositoryError> _errorsStreamController =
      StreamController<ChatRepositoryError>.broadcast();

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
  Future<void> close() async {
    await _messagesStreamController.close();
    await _errorsStreamController.close();
  }

  @override
  Future<void> initialize({required String interlocutorId}) async {
    _chatStreamSubscription = _remoteDataSource
        .getAddedModifiedMessagesStream(interlocutorId: interlocutorId)
        .listen(_onChatStreamMessageReceived, onError: _onChatStreamErrorReceived);
  }

  @override
  Future<void> cleanup() async {
    await _chatStreamSubscription?.cancel();
  }

  @override
  Future<void> markAsViewed({required String interlocutorId}) async {
    try {
      await _remoteDataSource.markAsViewed(interlocutorId: interlocutorId);
    } on Object {
      _emitError(const ChatMarkAsViewedFailure());
      rethrow;
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
  }

  void _onChatStreamErrorReceived(Object error, StackTrace stackTrace) {
    _emitError(const ChatRepositoryGenericFailure());
    Error.throwWithStackTrace(error, stackTrace);
  }
}
