/// Cross-feature read access to the signed-in user id (session identity).
abstract interface class CurrentUserPort {
  /// Signed-in user id, or empty when there is no session.
  String get currentUserId;
}
