import 'package:flutter/foundation.dart';
import 'package:home/domain/entities/family_role.dart';

/// Профиль авторизованного пользователя.
@immutable
final class CurrentUser {
  const CurrentUser({
    required this.userId,
    required this.displayName,
    this.familyRole,
    this.inviterId,
  });

  final String userId;
  final String displayName;

  /// Роль в семье; `null` — друг (не член семьи).
  final FamilyRole? familyRole;

  /// Кто пригласил пользователя (host / inviter).
  final String? inviterId;

  bool get canInvite => familyRole != null;

  bool get canInviteFamilyMembers => familyRole == FamilyRole.parent;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CurrentUser &&
        other.userId == userId &&
        other.displayName == displayName &&
        other.familyRole == familyRole &&
        other.inviterId == inviterId;
  }

  @override
  int get hashCode => Object.hash(userId, displayName, familyRole, inviterId);
}
