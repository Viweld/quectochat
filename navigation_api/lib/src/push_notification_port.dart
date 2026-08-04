/// Narrow port for registering push notification tokens (FCM).
abstract interface class PushNotificationPort {
  /// Upserts the current device FCM token for the signed-in user.
  ///
  /// Replaces the previously registered token for this installation when it rotates.
  Future<void> registerDeviceToken({required String token, required String platform});

  /// Removes the token when the user logs out or the token rotates away.
  Future<void> unregisterDeviceToken({required String token});

  /// Removes the last known token for this installation (used on logout).
  ///
  /// [fallbackToken] is deleted as well when the locally stored token is missing
  /// or differs (e.g. FCM already rotated).
  Future<void> unregisterCurrentDevice({String? fallbackToken});
}
