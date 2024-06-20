part of 'firebase_facade.dart';

/// Маппер данных: firebase <-> model
class _Mapper {
  /// Маппинг данных пользователя на модель CurrentUser
  CurrentUser _parseCurrentUser(User userData) {
    return CurrentUser(
      fullName: userData.displayName ?? '',
    );
  }

  Map<String, Object?> _mapCurrentUser(User userData) => {
        _Constants._fUser$id: userData.uid,
        _Constants._fUser$nickName: userData.displayName,
        _Constants._fUser$photoUrl: userData.photoURL,
        _Constants._fUser$chattingWith: null,
        _Constants._fUser$createdAt:
            DateTime.now().millisecondsSinceEpoch.toString(),
      };
}
