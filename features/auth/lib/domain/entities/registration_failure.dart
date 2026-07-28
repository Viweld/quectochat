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
