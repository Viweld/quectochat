import 'package:home/data/dto/interlocutor_dto.dart';
import 'package:home/data/dto/message_preview_dto.dart';
import 'package:shared_domain/shared_domain.dart';

Interlocutor mapInterlocutorDtoToDomain({
  required InterlocutorDto dto,
  required String currentUserId,
}) {
  final MessagePreviewDto? lastMessage = dto.lastMessage;
  if (lastMessage == null) {
    return Interlocutor(
      userId: dto.user.userId,
      firstName: dto.user.firstName,
      lastName: dto.user.lastName,
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
      .map(
        (InterlocutorDto dto) => mapInterlocutorDtoToDomain(dto: dto, currentUserId: currentUserId),
      )
      .toSet();
}

Paginated<Interlocutor> mapInterlocutorDtosPaginatedToDomain({
  required Paginated<InterlocutorDto> paginated,
  required String currentUserId,
}) {
  return Paginated<Interlocutor>(
    hasNext: paginated.hasNext,
    result: paginated.result.map(
      (InterlocutorDto dto) => mapInterlocutorDtoToDomain(dto: dto, currentUserId: currentUserId),
    ),
  );
}
