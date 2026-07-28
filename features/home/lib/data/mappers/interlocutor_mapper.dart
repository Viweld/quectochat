import 'package:shared_domain/shared_domain.dart';

import '../dto/interlocutor_dto.dart';

Interlocutor mapInterlocutorDtoToDomain({
  required InterlocutorDto dto,
  required String currentUserId,
}) {
  final lastMessage = dto.lastMessage;
  if (lastMessage == null) {
    return Interlocutor(
      userId: dto.user.userId,
      firstName: dto.user.firstName,
      lastName: dto.user.lastName,
      lastSentContent: null,
      lastSentContentType: null,
      lastSentAt: null,
      isSentByYou: false,
    );
  }

  return Interlocutor(
    userId: dto.user.userId,
    firstName: dto.user.firstName,
    lastName: dto.user.lastName,
    lastSentContent: lastMessage.content,
    lastSentContentType: _parseMessageContentType(lastMessage.type),
    lastSentAt: lastMessage.createdAt,
    isSentByYou: lastMessage.fromId == currentUserId,
  );
}

MessageContentType? _parseMessageContentType(String? value) {
  return switch (value) {
    'text' => MessageContentType.text,
    'image' => MessageContentType.image,
    _ => null,
  };
}

Set<Interlocutor> mapInterlocutorDtosToDomain({
  required Iterable<InterlocutorDto> dtos,
  required String currentUserId,
}) {
  return dtos
      .map((dto) => mapInterlocutorDtoToDomain(dto: dto, currentUserId: currentUserId))
      .toSet();
}

Paginated<Interlocutor> mapInterlocutorDtosPaginatedToDomain({
  required Paginated<InterlocutorDto> paginated,
  required String currentUserId,
}) {
  return Paginated<Interlocutor>(
    hasNext: paginated.hasNext,
    result: paginated.result.map(
      (dto) => mapInterlocutorDtoToDomain(dto: dto, currentUserId: currentUserId),
    ),
  );
}
