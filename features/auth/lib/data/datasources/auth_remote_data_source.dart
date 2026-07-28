/// Remote auth data access (Auth SDK + user profile).
abstract interface class AuthRemoteDataSource {
  Future<bool> checkAuth();

  /// Signed-in user id, or empty when there is no session.
  String get currentUserId;

  Future<void> logIn({required String email, required String password});

  Future<void> registration({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });

  Future<void> logOut();
}
