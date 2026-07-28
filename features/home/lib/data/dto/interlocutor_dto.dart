import 'package:flutter/foundation.dart';

import 'message_preview_dto.dart';
import 'user_dto.dart';

/// Combined user document and optional last-message preview for home list.
@immutable
final class InterlocutorDto {
  const InterlocutorDto({required this.user, this.lastMessage});

  final UserDto user;
  final MessagePreviewDto? lastMessage;
}
