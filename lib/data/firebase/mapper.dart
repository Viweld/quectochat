part of 'firebase_facade.dart';

/// Маппер данных: firebase <-> model
class _Mapper {
  /// Маппинг данных пользователя на модель CurrentUser
  UserDetails _parseCurrentUser(Map<String, Object?> src) {
    return UserDetails(
      id: src[_Keys._fUser$id] as String,
      fullName: src[_Keys._fUser$fullName] as String,
      createdAt: DateTime.parse('${src[_Keys._fUser$createdAt]}'),
    );
  }

  Map<String, Object?> _mapCurrentUser(UserDetails src) => {
        _Keys._fUser$id: src.id,
        _Keys._fUser$fullName: src.fullName,
        _Keys._fUser$createdAt: src.createdAt,
      };
}
