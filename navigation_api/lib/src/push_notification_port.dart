/// Narrow port for registering push notification tokens (FCM).
abstract interface class PushNotificationPort {
  /// Upserts the current device FCM token for the signed-in user.
  Future<void> registerDeviceToken({required String token, required String platform});

  /// Removes the token when the user logs out or the token rotates away.
  Future<void> unregisterDeviceToken({required String token});
}
