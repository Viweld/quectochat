import 'package:auth/domain/entities/invite_target_role.dart';
import 'package:flutter/foundation.dart';

/// Newly created invitation for sharing (code + QR).
@immutable
final class CreatedInvitation {
  const CreatedInvitation({
    required this.id,
    required this.code,
    required this.targetRole,
    required this.expiresAt,
  });

  final String id;

  /// Raw 8-char code without hyphen.
  final String code;
  final InviteTargetRole targetRole;
  final DateTime expiresAt;

  /// Display form `XXXX-XXXX`.
  String get formattedCode {
    if (code.length != 8) return code;
    return '${code.substring(0, 4)}-${code.substring(4)}';
  }
}
