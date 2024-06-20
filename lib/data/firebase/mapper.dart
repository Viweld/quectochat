part of 'firebase_facade.dart';

/// Маппер данных: firebase <-> model
class _Mapper {
  /// Маппинг данных пользователя на модель CurrentUser
  CurrentUser _mapCurrentUser(User userData) {
    return CurrentUser(
      fullName: userData.displayName ?? '',
    );
  }
}
