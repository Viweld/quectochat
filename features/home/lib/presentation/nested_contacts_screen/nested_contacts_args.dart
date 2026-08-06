import 'package:flutter/foundation.dart';

/// Arguments for nested contacts BLoC / screen.
@immutable
final class NestedContactsArgs {
  const NestedContactsArgs({
    required this.anchorUserId,
    required this.anchorDisplayName,
    required this.isFriendsOfRelative,
  });

  final String anchorUserId;
  final String anchorDisplayName;
  final bool isFriendsOfRelative;
}
