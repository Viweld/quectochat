import 'dart:async';

import '../models/user_details.dart';

/// возможные состояния аутентификации пользователя
enum AuthStatus {
  authorized,
  notAuthorized,
}

typedef AuthSubscription = StreamSubscription<AuthStatus>;

// -----------------------------------------------------------------------------
/// репозиторий аутентификации
abstract interface class IAuthRepository {
  /// Геттер, возвращающий исходный статус
  AuthStatus get authStatus;

  /// закрытие репозитория, закрытие стримов
  Future<void> close();

  /// подписка на изменения в репозитории
  AuthSubscription subscribe(Function(AuthStatus) listener);

  // АВТОРИЗАЦИЯ
  // --------------------------------------------------------------------------
  /// Проверка залогиненности пользователя
  void checkAuth();

  /// Логин пользователя
  Future<void> logIn({
    required String email,
    required String password,
  });

  // РЕГИСТРАЦИЯ
  // --------------------------------------------------------------------------
  /// Регистрация пользователя
  Future<void> registration({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });

  // ВЫХОД
  // --------------------------------------------------------------------------
  /// Разлогин пользователя
  Future<void> logOut();
}
