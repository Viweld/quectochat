// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auth/presentation/create_invitation_screen/create_invitation_screen.dart'
    as _i1;
import 'package:auth/presentation/invite_code_screen/invite_code_screen.dart'
    as _i2;
import 'package:auth/presentation/invite_qr_scanner_screen/invite_qr_scanner_screen.dart'
    as _i3;
import 'package:auth/presentation/login_screen/login_screen.dart' as _i4;
import 'package:auth/presentation/registration_screen/registration_screen.dart'
    as _i5;
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

/// generated route for
/// [_i1.CreateInvitationScreen]
class CreateInvitationRoute
    extends _i6.PageRouteInfo<CreateInvitationRouteArgs> {
  CreateInvitationRoute({
    _i7.Key? key,
    required String targetRole,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         CreateInvitationRoute.name,
         args: CreateInvitationRouteArgs(key: key, targetRole: targetRole),
         initialChildren: children,
       );

  static const String name = 'CreateInvitationRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateInvitationRouteArgs>();
      return _i1.CreateInvitationScreen(
        key: args.key,
        targetRole: args.targetRole,
      );
    },
  );
}

class CreateInvitationRouteArgs {
  const CreateInvitationRouteArgs({this.key, required this.targetRole});

  final _i7.Key? key;

  final String targetRole;

  @override
  String toString() {
    return 'CreateInvitationRouteArgs{key: $key, targetRole: $targetRole}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreateInvitationRouteArgs) return false;
    return key == other.key && targetRole == other.targetRole;
  }

  @override
  int get hashCode => key.hashCode ^ targetRole.hashCode;
}

/// generated route for
/// [_i2.InviteCodeScreen]
class InviteCodeRoute extends _i6.PageRouteInfo<void> {
  const InviteCodeRoute({List<_i6.PageRouteInfo>? children})
    : super(InviteCodeRoute.name, initialChildren: children);

  static const String name = 'InviteCodeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.InviteCodeScreen();
    },
  );
}

/// generated route for
/// [_i3.InviteQrScannerScreen]
class InviteQrScannerRoute extends _i6.PageRouteInfo<void> {
  const InviteQrScannerRoute({List<_i6.PageRouteInfo>? children})
    : super(InviteQrScannerRoute.name, initialChildren: children);

  static const String name = 'InviteQrScannerRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.InviteQrScannerScreen();
    },
  );
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginScreen();
    },
  );
}

/// generated route for
/// [_i5.RegistrationScreen]
class RegistrationRoute extends _i6.PageRouteInfo<RegistrationRouteArgs> {
  RegistrationRoute({
    _i7.Key? key,
    required String inviteCode,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         RegistrationRoute.name,
         args: RegistrationRouteArgs(key: key, inviteCode: inviteCode),
         initialChildren: children,
       );

  static const String name = 'RegistrationRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegistrationRouteArgs>();
      return _i5.RegistrationScreen(key: args.key, inviteCode: args.inviteCode);
    },
  );
}

class RegistrationRouteArgs {
  const RegistrationRouteArgs({this.key, required this.inviteCode});

  final _i7.Key? key;

  final String inviteCode;

  @override
  String toString() {
    return 'RegistrationRouteArgs{key: $key, inviteCode: $inviteCode}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RegistrationRouteArgs) return false;
    return key == other.key && inviteCode == other.inviteCode;
  }

  @override
  int get hashCode => key.hashCode ^ inviteCode.hashCode;
}
