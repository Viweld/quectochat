/// Postgres table / column / RPC names for home data access.
abstract final class TableKeys {
  static const String profiles = 'profiles';
  static const String messages = 'messages';
  static const String getHomeFeed = 'get_home_feed';
  static const String getNestedContacts = 'get_nested_contacts';
  static const String getCurrentUserProfile = 'get_current_user_profile';
  static const String profileId = 'id';
  static const String profileDisplayName = 'display_name';
  static const String messageChatId = 'chat_id';
  static const String messageFromId = 'from_id';
  static const String messageToId = 'to_id';
  static const String messageCreatedAt = 'created_at';
}
