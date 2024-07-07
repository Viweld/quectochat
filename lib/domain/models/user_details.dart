import 'package:flutter/foundation.dart';

@immutable
final class UserDetails {
  const UserDetails({
    required this.id,
    required this.fullName,
    required this.createdAt,
  });

  final String id;
  final String fullName;
  final DateTime createdAt;
}
