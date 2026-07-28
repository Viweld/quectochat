// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:chat/presentation/chat_screen/chat_screen.dart' as _i1;
import 'package:flutter/material.dart' as _i3;

/// generated route for
/// [_i1.ChatScreen]
class ChatRoute extends _i2.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    required String interlocutorId,
    required String firstName,
    required String lastName,
    _i3.Key? key,
    List<_i2.PageRouteInfo>? children,
  }) : super(
         ChatRoute.name,
         args: ChatRouteArgs(
           interlocutorId: interlocutorId,
           firstName: firstName,
           lastName: lastName,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'ChatRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatRouteArgs>();
      return _i1.ChatScreen(
        interlocutorId: args.interlocutorId,
        firstName: args.firstName,
        lastName: args.lastName,
        key: args.key,
      );
    },
  );
}

class ChatRouteArgs {
  const ChatRouteArgs({
    required this.interlocutorId,
    required this.firstName,
    required this.lastName,
    this.key,
  });

  final String interlocutorId;

  final String firstName;

  final String lastName;

  final _i3.Key? key;

  @override
  String toString() {
    return 'ChatRouteArgs{interlocutorId: $interlocutorId, firstName: $firstName, lastName: $lastName, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChatRouteArgs) return false;
    return interlocutorId == other.interlocutorId &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        key == other.key;
  }

  @override
  int get hashCode =>
      interlocutorId.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      key.hashCode;
}
