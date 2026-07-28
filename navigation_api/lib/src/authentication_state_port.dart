import 'dart:async';

import 'package:shared_domain/shared_domain.dart';

/// Cross-feature read access to authentication state (guards, shell).
abstract interface class AuthenticationStatePort {
  AuthStatus get authStatus;

  Stream<AuthStatus> get authStatusStream;
}
