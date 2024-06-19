import '../models/current_user.dart';

abstract interface class IApiFacade {
  /// Логин пользователя
  Future<CurrentUser?> logIn({
    required String email,
    required String password,
  });

  /// Регистрация пользователя
  Future<CurrentUser?> registration({
    required String email,
    required String password,
  });
}
