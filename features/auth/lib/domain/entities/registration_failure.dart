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

/// No usable network path to the auth backend.
final class RegistrationNetworkFailure extends RegistrationFailure {
  const RegistrationNetworkFailure();
}

/// Auth backend unreachable or not responding.
final class RegistrationBackendFailure extends RegistrationFailure {
  const RegistrationBackendFailure();
}

/// Unexpected auth/API failure; [message] is for logs only.
final class RegistrationGenericFailure extends RegistrationFailure {
  const RegistrationGenericFailure({this.message});

  final String? message;
}

/// Invitation code is missing, expired, used, or revoked.
final class InvalidInviteFailure extends RegistrationFailure {
  const InvalidInviteFailure();
}
