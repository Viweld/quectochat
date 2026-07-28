/// Expected business failures for registration.
sealed class RegistrationFailure implements Exception {
  const RegistrationFailure();
}

final class WeakPasswordFailure extends RegistrationFailure {
  const WeakPasswordFailure();
}

final class EmailAlreadyUsedFailure extends RegistrationFailure {
  const EmailAlreadyUsedFailure();
}

/// Too many auth emails sent in a short period.
final class EmailRateLimitFailure extends RegistrationFailure {
  const EmailRateLimitFailure();
}

/// Unexpected auth/API failure; [message] is for logs only.
final class RegistrationGenericFailure extends RegistrationFailure {
  const RegistrationGenericFailure({this.message});

  final String? message;
}
