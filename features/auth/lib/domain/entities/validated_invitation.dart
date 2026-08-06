import 'package:auth/domain/entities/invite_target_role.dart';
import 'package:flutter/foundation.dart';

/// Result of a successful invitation validation (no PII).
@immutable
final class ValidatedInvitation {
  const ValidatedInvitation({
    required this.targetRole,
    required this.createsFamily,
    required this.expiresAt,
  });

  final InviteTargetRole targetRole;
  final bool createsFamily;
  final DateTime expiresAt;
}
