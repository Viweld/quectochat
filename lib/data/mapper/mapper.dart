import 'package:firebase_auth/firebase_auth.dart';
import 'package:quectochat/domain/models/current_user.dart';

/// Маппер сетевых данных на доменные модели
class ApiDataMapper {
  /// Маппинг данных пользователя на модель CurrentUser
  CurrentUser mapCurrentUser(User userData) {
    return CurrentUser(
      fullName: userData.displayName ?? '',
    );
  }
}
