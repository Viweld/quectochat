/// Marks inbound chat messages as delivered while the app is in foreground.
abstract interface class ChatDeliveryAckPort {
  Future<void> startTracking();

  Future<void> stopTracking();
}
