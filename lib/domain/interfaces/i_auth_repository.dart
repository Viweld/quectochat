import 'dart:async';

import '../models/current_user.dart';

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
  /// Логин пользователя
  Future<CurrentUser?> logIn({
    required String email,
    required String password,
  });

  // РЕГИСТРАЦИЯ
  // --------------------------------------------------------------------------
  /// Регистрация пользователя
  Future<CurrentUser?> registration({
    required String email,
    required String password,
  });

  // ВЫХОД
  // --------------------------------------------------------------------------
  /// Разлогин пользователя
  Future<void> logOut();
}
