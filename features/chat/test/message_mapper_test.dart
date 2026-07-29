import 'package:chat/data/dto/message_dto.dart';
import 'package:chat/data/mappers/message_mapper.dart';
import 'package:chat/domain/entities/message.dart';
import 'package:chat/domain/entities/message_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_domain/shared_domain.dart';

void main() {
  test('mapMessageDtoToDomain maps transport DTO to domain Message', () {
    final MessageDto dto = MessageDto(
      id: 'm1',
      chatId: 'c1',
      fromId: 'u1',
      toId: 'u2',
      content: 'hello',
      type: 'text',
      createdAt: DateTime.utc(2024, 1, 2, 3, 4, 5),
      deliveredAt: DateTime.utc(2024, 1, 2, 3, 4, 6),
      readAt: DateTime.utc(2024, 1, 2, 3, 4, 7),
    );

    final Message message = mapMessageDtoToDomain(dto: dto, currentUserId: 'u1');

    expect(message.id, 'm1');
    expect(message.fromId, 'u1');
    expect(message.toId, 'u2');
    expect(message.content, 'hello');
    expect(message.type, MessageContentType.text);
    expect(message.deliveredAt, DateTime.utc(2024, 1, 2, 3, 4, 6));
    expect(message.readAt, DateTime.utc(2024, 1, 2, 3, 4, 7));
    expect(message.status, MessageStatus.read);
    expect(message.isOwn, isTrue);
    expect(message.createdAt, DateTime.utc(2024, 1, 2, 3, 4, 5));
  });

  test('Message.status reflects deliveredAt and readAt', () {
    final Message sent = Message(
      id: 'm1',
      chatId: 'c1',
      fromId: 'u1',
      toId: 'u2',
      createdAt: DateTime.utc(2024),
      content: 'hello',
      type: MessageContentType.text,
      deliveredAt: null,
      readAt: null,
      isOwn: true,
    );
    final Message delivered = Message(
      id: 'm1',
      chatId: 'c1',
      fromId: 'u1',
      toId: 'u2',
      createdAt: DateTime.utc(2024),
      content: 'hello',
      type: MessageContentType.text,
      deliveredAt: DateTime.utc(2024, 1, 1, 0, 0, 1),
      readAt: null,
      isOwn: true,
    );
    final Message read = Message(
      id: 'm1',
      chatId: 'c1',
      fromId: 'u1',
      toId: 'u2',
      createdAt: DateTime.utc(2024),
      content: 'hello',
      type: MessageContentType.text,
      deliveredAt: DateTime.utc(2024, 1, 1, 0, 0, 1),
      readAt: DateTime.utc(2024, 1, 1, 0, 0, 2),
      isOwn: true,
    );

    expect(sent.status, MessageStatus.sent);
    expect(delivered.status, MessageStatus.delivered);
    expect(read.status, MessageStatus.read);
    expect(sent == delivered, isFalse);
    expect(delivered == read, isFalse);
  });
}
