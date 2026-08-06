import 'package:home/data/dto/interlocutor_dto.dart';
import 'package:home/data/dto/message_preview_dto.dart';
import 'package:shared_domain/shared_domain.dart';

Interlocutor mapInterlocutorDtoToDomain({
  required InterlocutorDto dto,
  required String currentUserId,
}) {
  final MessagePreviewDto? lastMessage = dto.lastMessage;
  final InterlocutorSection section = switch (dto.section) {
    'pinned' => InterlocutorSection.pinned,
    _ => InterlocutorSection.contacts,
  };

  if (lastMessage == null) {
    return Interlocutor(
      userId: dto.user.userId,
      displayName: dto.user.displayName,
      isSentByYou: false,
      section: section,
      isPinned: dto.isPinned,
      nestedUnreadContactCount: dto.nestedUnreadContactCount,
    );
  }

  return Interlocutor(
    userId: dto.user.userId,
    displayName: dto.user.displayName,
    lastSentContent: lastMessage.content,
    lastSentContentType: _parseMessageContentType(lastMessage.type),
    lastSentAt: lastMessage.createdAt,
    isSentByYou: lastMessage.fromId == currentUserId,
    section: section,
    isPinned: dto.isPinned,
    nestedUnreadContactCount: dto.nestedUnreadContactCount,
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
