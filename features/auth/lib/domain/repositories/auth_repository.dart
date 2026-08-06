import 'dart:async';

import 'package:auth/domain/entities/created_invitation.dart';
import 'package:auth/domain/entities/invitation_failure.dart';
import 'package:auth/domain/entities/invite_target_role.dart';
import 'package:auth/domain/entities/login_failure.dart';
import 'package:auth/domain/entities/registration_failure.dart';
import 'package:auth/domain/entities/validated_invitation.dart';
import 'package:shared_domain/shared_domain.dart';

/// Auth session repository (own feature).
abstract interface class AuthRepository {
  /// Current auth status.
  AuthStatus get authStatus;

  /// Signed-in user id, or empty when there is no session.
  String get currentUserId;

  /// Stream of auth status changes.
  Stream<AuthStatus> get authStatusStream;

  /// Checks whether the user is logged in.
  Future<void> checkAuth();

  /// Logs the user in.
  Future<Outcome<void, LoginFailure>> logIn({required String email, required String password});

  /// Registers a new user and redeems [inviteCode].
  Future<Outcome<void, RegistrationFailure>> registration({
    required String displayName,
    required String email,
    required String password,
    required String inviteCode,
  });

  /// Validates an invite code before registration.
  Future<Outcome<ValidatedInvitation, InvitationFailure>> validateInvitation({
    required String code,
  });

  /// Creates a new invitation for [targetRole] (family members only).
  Future<Outcome<CreatedInvitation, InvitationFailure>> createInvitation({
    required InviteTargetRole targetRole,
  });

  /// Logs the user out.
  Future<void> logOut();
}
