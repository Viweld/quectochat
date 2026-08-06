import 'package:flutter_test/flutter_test.dart';
import 'package:home/data/dto/interlocutor_dto.dart';
import 'package:home/data/dto/message_preview_dto.dart';
import 'package:home/data/dto/user_dto.dart';
import 'package:home/data/mappers/interlocutor_mapper.dart';
import 'package:shared_domain/shared_domain.dart';

void main() {
  const UserDto user = UserDto(userId: 'u1', displayName: 'Ada Lovelace');

  test('maps interlocutor without last message', () {
    final Interlocutor mapped = mapInterlocutorDtoToDomain(
      dto: const InterlocutorDto(user: user),
      currentUserId: 'me',
    );

    expect(mapped.userId, 'u1');
    expect(mapped.displayName, 'Ada Lovelace');
    expect(mapped.lastSentContent, isNull);
    expect(mapped.isSentByYou, isFalse);
  });

  test('maps interlocutor with last message from current user', () {
    final DateTime sentAt = DateTime.utc(2026, 7, 28);
    final Interlocutor mapped = mapInterlocutorDtoToDomain(
      dto: InterlocutorDto(
        user: user,
        lastMessage: MessagePreviewDto(
          content: 'hi',
          type: 'text',
          createdAt: sentAt,
          fromId: 'me',
        ),
      ),
      currentUserId: 'me',
    );

    expect(mapped.lastSentContent, 'hi');
    expect(mapped.lastSentContentType, MessageContentType.text);
    expect(mapped.lastSentAt, sentAt);
    expect(mapped.isSentByYou, isTrue);
  });
}
