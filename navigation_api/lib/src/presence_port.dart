import 'dart:async';

/// Cross-feature access to the online presence roster and last-seen timestamps.
abstract interface class PresencePort {
  Future<void> startTracking();

  Future<void> stopTracking();

  Stream<Set<String>> get onlineUserIdsStream;

  Stream<DateTime?> watchLastSeenAt(String userId);
}
