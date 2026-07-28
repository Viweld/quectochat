import 'dart:async';

/// Possible authentication states of the user.
enum AuthStatus { authorized, notAuthorized }

/// Subscription to [AuthStatus] changes.
typedef AuthSubscription = StreamSubscription<AuthStatus>;
