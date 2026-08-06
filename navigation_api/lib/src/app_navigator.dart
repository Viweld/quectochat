/// Navigation port — features depend on this, not on concrete navigator.
abstract interface class AppNavigator {
  Future<void> navigateBack([Object? result]);

  Future<void> navigateLogin();

  Future<void> navigateInviteCode();

  Future<String?> navigateInviteQrScanner();

  Future<void> navigateRegistration({required String inviteCode});

  Future<void> navigateHome();

  Future<void> navigateChat({required String interlocutorId, required String displayName});

  Future<void> navigateNestedContacts({
    required String anchorUserId,
    required String anchorDisplayName,
    required bool isFriendsOfRelative,
  });

  Future<void> navigateCreateInvitation({required String targetRole});

  /// Opens fullscreen image viewer. [imageUrls] must be non-empty.
  Future<void> navigateImageViewer({
    required List<String> imageUrls,
    required String initialUrl,
    String? heroTag,
  });
}
