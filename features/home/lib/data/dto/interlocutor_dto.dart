import 'package:flutter/foundation.dart';

import 'package:home/data/dto/message_preview_dto.dart';
import 'package:home/data/dto/user_dto.dart';

/// Combined user document and optional last-message preview for home list.
@immutable
final class InterlocutorDto {
  const InterlocutorDto({required this.user, this.lastMessage});

  final UserDto user;
  final MessagePreviewDto? lastMessage;
}
