/// Narrow session actions for other features (e.g. home logout).
abstract interface class AuthSessionPort {
  Future<void> logOut();
}
