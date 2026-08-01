/// Syncs the app-icon unread badge with server unread message count.
abstract interface class BadgeSyncPort {
  Future<void> startTracking();

  Future<void> stopTracking();
}
