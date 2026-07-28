import 'dart:async';

import 'package:auth/domain/entities/login_failure.dart';
import 'package:auth/domain/entities/registration_failure.dart';
import 'package:shared_domain/shared_domain.dart';

/// Auth session repository (own feature).
abstract interface class AuthRepository {
  /// Current auth status.
  AuthStatus get authStatus;

  /// Signed-in user id, or empty when there is no session.
  String get currentUserId;

  /// Stream of auth status changes.
  Stream<AuthStatus> get authStatusStream;

  /// Closes streams.
  Future<void> close();

  /// Subscribes to auth status changes.
  AuthSubscription subscribe(void Function(AuthStatus) listener);

  /// Checks whether the user is logged in.
  Future<void> checkAuth();

  /// Logs the user in.
  Future<Outcome<void, LoginFailure>> logIn({required String email, required String password});

  /// Registers a new user.
  Future<Outcome<void, RegistrationFailure>> registration({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });

  /// Logs the user out.
  Future<void> logOut();
}
