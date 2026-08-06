/// Remote auth data access (Auth SDK + user profile + invitations).
abstract interface class AuthRemoteDataSource {
  Future<bool> checkAuth();

  /// Signed-in user id, or empty when there is no session.
  String get currentUserId;

  Future<void> logIn({required String email, required String password});

  Future<void> registration({
    required String displayName,
    required String email,
    required String password,
    required String inviteCode,
  });

  Future<Map<String, dynamic>> validateInvitation({required String code});

  Future<Map<String, dynamic>> createInvitation({required String targetRole});

  Future<void> logOut();
}
