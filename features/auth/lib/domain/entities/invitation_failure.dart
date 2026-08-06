/// Expected business failures when validating or redeeming an invitation.
sealed class InvitationFailure implements Exception {
  const InvitationFailure();
}

final class InvitationNotFoundFailure extends InvitationFailure {
  const InvitationNotFoundFailure();
}

final class InvitationExpiredFailure extends InvitationFailure {
  const InvitationExpiredFailure();
}

final class InvitationUsedFailure extends InvitationFailure {
  const InvitationUsedFailure();
}

final class InvitationRevokedFailure extends InvitationFailure {
  const InvitationRevokedFailure();
}

final class InvitationInvalidFormatFailure extends InvitationFailure {
  const InvitationInvalidFormatFailure();
}

final class InvitationNetworkFailure extends InvitationFailure {
  const InvitationNetworkFailure();
}

final class InvitationBackendFailure extends InvitationFailure {
  const InvitationBackendFailure();
}

final class InvitationGenericFailure extends InvitationFailure {
  const InvitationGenericFailure({this.message});

  final String? message;
}
