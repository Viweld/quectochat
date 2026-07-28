/// Expected business failures for login.
sealed class LoginFailure implements Exception {
  const LoginFailure();
}

final class InvalidCredentialFailure extends LoginFailure {
  const InvalidCredentialFailure();
}

final class UserNotFoundFailure extends LoginFailure {
  const UserNotFoundFailure();
}

final class WrongPasswordFailure extends LoginFailure {
  const WrongPasswordFailure();
}
