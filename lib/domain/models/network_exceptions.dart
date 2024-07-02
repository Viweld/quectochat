sealed class NetworkException {}

/// Пользователь не найден при попытке логина
final class LoginInvalidCredential implements NetworkException {}

/// Пользователь не найден при попытке логина
final class LoginUserNotFound implements NetworkException {}

/// Неправильный пароль при попытке логина
final class LoginUserWrongPassword implements NetworkException {}

/// Введен слабый пароль при регистрации
final class RegistrationWeakPassword implements NetworkException {}

/// Введенный при регистрации email уже занят
final class RegistrationEmailAlreadyUsed implements NetworkException {}
