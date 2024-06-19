import 'package:flutter/foundation.dart';

@immutable
class CurrentUser {
  const CurrentUser({
    required this.fullName,
  });

  final String fullName;
}
