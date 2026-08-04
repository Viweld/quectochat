/// Clears delivered chat push notifications for a specific interlocutor.
abstract interface class ChatNotificationClearPort {
  Future<void> clearForInterlocutor(String interlocutorId);
}
