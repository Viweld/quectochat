/// Postgres / Auth table and column names for auth profile writes.
abstract final class TableKeys {
  static const String profiles = 'profiles';
  static const String profileId = 'id';
  static const String profileDisplayName = 'display_name';
  static const String validateInvitation = 'validate_invitation';
  static const String redeemInvitation = 'redeem_invitation';
  static const String createInvitation = 'create_invitation';
}
