import 'package:chat/data/dto/message_dto.dart';
import 'package:chat/data/mappers/message_mapper.dart';
import 'package:chat/domain/entities/message.dart';
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
      isViewed: true,
    );

    final Message message = mapMessageDtoToDomain(dto: dto, currentUserId: 'u1');

    expect(message.id, 'm1');
    expect(message.fromId, 'u1');
    expect(message.toId, 'u2');
    expect(message.content, 'hello');
    expect(message.type, MessageContentType.text);
    expect(message.isViewed, isTrue);
    expect(message.isOwn, isTrue);
    expect(message.createdAt, DateTime.utc(2024, 1, 2, 3, 4, 5));
  });
}
