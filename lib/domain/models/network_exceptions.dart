sealed class NetworkException {}

/// Пользователь не найден при попытке логина
final class AuthUserNotFound implements NetworkException {}

/// Неправильный пароль при попытке логина
final class AuthUserWrongPassword implements NetworkException {}

/// Введен слабый пароль при регистрации
final class RegistrationWeakPassword implements NetworkException {}

/// Введенный при регистрации email уже занят
final class RegistrationEmailAlreadyUsed implements NetworkException {}
