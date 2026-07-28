import 'package:chat/data/dto/message_dto.dart';
import 'package:chat/domain/entities/message.dart';
import 'package:shared_domain/shared_domain.dart';

Message mapMessageDtoToDomain({required MessageDto dto, required String currentUserId}) {
  return Message(
    id: dto.id,
    chatId: dto.chatId,
    fromId: dto.fromId,
    toId: dto.toId,
    isViewed: dto.isViewed,
    isOwn: dto.fromId == currentUserId,
    content: dto.content,
    type: _parseMessageContentType(dto.type),
    createdAt: dto.createdAt,
  );
}

String mapMessageContentTypeToTransport(MessageContentType type) {
  return switch (type) {
    MessageContentType.text => 'text',
    MessageContentType.image => 'image',
  };
}

MessageContentType _parseMessageContentType(String value) {
  return switch (value) {
    'text' => MessageContentType.text,
    'image' => MessageContentType.image,
    _ => throw UnsupportedError('Unknown message type: $value'),
  };
}
