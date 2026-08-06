import 'package:flutter/foundation.dart';

/// Transport model for a profile row.
@immutable
final class UserDto {
  const UserDto({required this.userId, required this.displayName, this.familyRole, this.inviterId});

  final String userId;
  final String displayName;
  final String? familyRole;
  final String? inviterId;

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      userId: (json['id'] ?? json['user_id'] ?? json['partner_id']) as String,
      displayName: json['display_name'] as String,
      familyRole: json['family_role'] as String?,
      inviterId: json['inviter_id'] as String?,
    );
  }
}
