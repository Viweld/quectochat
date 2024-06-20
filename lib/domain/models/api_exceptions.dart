sealed class ApiException {}

/// Пользователь не найден при попытке логина
final class AuthUserNotFound implements ApiException {}

/// Неправильный пароль при попытке логина
final class AuthUserWrongPassword implements ApiException {}

/// Введен слабый пароль при регистрации
final class RegistrationWeakPassword implements ApiException {}

/// Неправильный пароль при попытке логина
final class RegistrationEmailAlreadyUsed implements ApiException {}
