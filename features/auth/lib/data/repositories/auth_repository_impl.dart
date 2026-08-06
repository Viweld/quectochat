import 'dart:async';

import 'package:auth/data/datasources/auth_remote_data_source.dart';
import 'package:auth/domain/entities/created_invitation.dart';
import 'package:auth/domain/entities/invitation_failure.dart';
import 'package:auth/domain/entities/invite_target_role.dart';
import 'package:auth/domain/entities/login_failure.dart';
import 'package:auth/domain/entities/registration_failure.dart';
import 'package:auth/domain/entities/validated_invitation.dart';
import 'package:auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_domain/shared_domain.dart';

@LazySingleton(as: AuthRepository)
final class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final StreamController<AuthStatus> _authStreamController;
  AuthStatus _authStatus;

  AuthRepositoryImpl({required AuthRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource,
      _authStreamController = StreamController<AuthStatus>.broadcast(),
      // Session may already be restored by Supabase.initialize before DI runs.
      _authStatus = remoteDataSource.currentUserId.isNotEmpty
          ? AuthStatus.authorized
          : AuthStatus.notAuthorized;

  @override
  AuthStatus get authStatus => _authStatus;

  @override
  String get currentUserId => _remoteDataSource.currentUserId;

  @override
  Stream<AuthStatus> get authStatusStream => _authStreamController.stream;

  @override
  Future<void> checkAuth() async {
    final bool isLoggedIn = await _remoteDataSource.checkAuth();
    _authStatus = isLoggedIn ? AuthStatus.authorized : AuthStatus.notAuthorized;
    if (!_authStreamController.isClosed) {
      _authStreamController.add(_authStatus);
    }
  }

  @override
  Future<Outcome<void, LoginFailure>> logIn({
    required String email,
    required String password,
  }) async {
    try {
      await _remoteDataSource.logIn(email: email, password: password);
      _authStatus = AuthStatus.authorized;
      if (!_authStreamController.isClosed) {
        _authStreamController.add(_authStatus);
      }
      return const Success<void, LoginFailure>(null);
    } on LoginFailure catch (failure) {
      return Failure<void, LoginFailure>(failure);
    }
  }

  @override
  Future<void> logOut() async {
    await _remoteDataSource.logOut();
    _authStatus = AuthStatus.notAuthorized;
    if (!_authStreamController.isClosed) {
      _authStreamController.add(_authStatus);
    }
  }

  @override
  Future<Outcome<void, RegistrationFailure>> registration({
    required String displayName,
    required String email,
    required String password,
    required String inviteCode,
  }) async {
    try {
      await _remoteDataSource.registration(
        displayName: displayName,
        email: email,
        password: password,
        inviteCode: inviteCode,
      );
      _authStatus = AuthStatus.authorized;
      if (!_authStreamController.isClosed) {
        _authStreamController.add(_authStatus);
      }
      return const Success<void, RegistrationFailure>(null);
    } on RegistrationFailure catch (failure) {
      return Failure<void, RegistrationFailure>(failure);
    }
  }

  @override
  Future<Outcome<ValidatedInvitation, InvitationFailure>> validateInvitation({
    required String code,
  }) async {
    try {
      final Map<String, dynamic> row = await _remoteDataSource.validateInvitation(code: code);
      final bool isValid = row['is_valid'] as bool? ?? false;
      if (!isValid) {
        return Failure<ValidatedInvitation, InvitationFailure>(
          _mapValidateFailureReason(row['failure_reason'] as String?),
        );
      }

      final InviteTargetRole? role = parseInviteTargetRole(row['target_role'] as String?);
      if (role == null) {
        return const Failure<ValidatedInvitation, InvitationFailure>(InvitationNotFoundFailure());
      }

      final Object? expiresRaw = row['expires_at'];
      final DateTime expiresAt = expiresRaw is String
          ? DateTime.parse(expiresRaw)
          : DateTime.now().toUtc();

      return Success<ValidatedInvitation, InvitationFailure>(
        ValidatedInvitation(
          targetRole: role,
          createsFamily: row['creates_family'] as bool? ?? false,
          expiresAt: expiresAt,
        ),
      );
    } on InvitationFailure catch (failure) {
      return Failure<ValidatedInvitation, InvitationFailure>(failure);
    }
  }

  @override
  Future<Outcome<CreatedInvitation, InvitationFailure>> createInvitation({
    required InviteTargetRole targetRole,
  }) async {
    try {
      final Map<String, dynamic> row = await _remoteDataSource.createInvitation(
        targetRole: inviteTargetRoleToTransport(targetRole),
      );
      final InviteTargetRole? role = parseInviteTargetRole(row['target_role'] as String?);
      final String? code = row['code'] as String?;
      final String? id = row['id']?.toString();
      if (role == null || code == null || id == null) {
        return const Failure<CreatedInvitation, InvitationFailure>(InvitationBackendFailure());
      }

      final Object? expiresRaw = row['expires_at'];
      final DateTime expiresAt = expiresRaw is String
          ? DateTime.parse(expiresRaw)
          : DateTime.now().toUtc().add(const Duration(days: 7));

      return Success<CreatedInvitation, InvitationFailure>(
        CreatedInvitation(id: id, code: code, targetRole: role, expiresAt: expiresAt),
      );
    } on InvitationFailure catch (failure) {
      return Failure<CreatedInvitation, InvitationFailure>(failure);
    }
  }

  InvitationFailure _mapValidateFailureReason(String? reason) => switch (reason) {
    'expired' => const InvitationExpiredFailure(),
    'used' => const InvitationUsedFailure(),
    'revoked' => const InvitationRevokedFailure(),
    'invalid_format' => const InvitationInvalidFormatFailure(),
    _ => const InvitationNotFoundFailure(),
  };
}
