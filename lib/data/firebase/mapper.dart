part of 'firebase_facade.dart';

/// Маппер данных: firebase <-> model
class _Mapper {
  /// Маппинг данных пользователя на модель CurrentUser
  UserDetails _parseCurrentUser(Map<String, Object?> src) {
    return UserDetails(
      id: src[_Constants._fUser$id] as String,
      fullName: src[_Constants._fUser$fullName] as String,
      createdAt: DateTime.parse('${src[_Constants._fUser$createdAt]}'),
    );
  }

  Map<String, Object?> _mapCurrentUser(UserDetails src) => {
        _Constants._fUser$id: src.id,
        _Constants._fUser$fullName: src.fullName,
        _Constants._fUser$createdAt: src.createdAt,
      };
}
