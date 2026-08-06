// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:home/presentation/home_screen/home_screen.dart' as _i1;
import 'package:home/presentation/nested_contacts_screen/nested_contacts_screen.dart'
    as _i2;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.NestedContactsScreen]
class NestedContactsRoute extends _i3.PageRouteInfo<NestedContactsRouteArgs> {
  NestedContactsRoute({
    _i4.Key? key,
    required String anchorUserId,
    required String anchorDisplayName,
    required bool isFriendsOfRelative,
    List<_i3.PageRouteInfo>? children,
  }) : super(
         NestedContactsRoute.name,
         args: NestedContactsRouteArgs(
           key: key,
           anchorUserId: anchorUserId,
           anchorDisplayName: anchorDisplayName,
           isFriendsOfRelative: isFriendsOfRelative,
         ),
         initialChildren: children,
       );

  static const String name = 'NestedContactsRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NestedContactsRouteArgs>();
      return _i2.NestedContactsScreen(
        key: args.key,
        anchorUserId: args.anchorUserId,
        anchorDisplayName: args.anchorDisplayName,
        isFriendsOfRelative: args.isFriendsOfRelative,
      );
    },
  );
}

class NestedContactsRouteArgs {
  const NestedContactsRouteArgs({
    this.key,
    required this.anchorUserId,
    required this.anchorDisplayName,
    required this.isFriendsOfRelative,
  });

  final _i4.Key? key;

  final String anchorUserId;

  final String anchorDisplayName;

  final bool isFriendsOfRelative;

  @override
  String toString() {
    return 'NestedContactsRouteArgs{key: $key, anchorUserId: $anchorUserId, anchorDisplayName: $anchorDisplayName, isFriendsOfRelative: $isFriendsOfRelative}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NestedContactsRouteArgs) return false;
    return key == other.key &&
        anchorUserId == other.anchorUserId &&
        anchorDisplayName == other.anchorDisplayName &&
        isFriendsOfRelative == other.isFriendsOfRelative;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      anchorUserId.hashCode ^
      anchorDisplayName.hashCode ^
      isFriendsOfRelative.hashCode;
}
