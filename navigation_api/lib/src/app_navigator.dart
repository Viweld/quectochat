/// Navigation port — features depend on this, not on concrete navigator.
abstract interface class AppNavigator {
  Future<void> navigateBack([Object? result]);

  Future<void> navigateLogin();

  Future<void> navigateRegistration();

  Future<void> navigateHome();

  Future<void> navigateChat({
    required String interlocutorId,
    required String firstName,
    required String lastName,
  });
}
