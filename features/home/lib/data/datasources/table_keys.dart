/// Postgres table / column / RPC names for home data access.
abstract final class TableKeys {
  static const String profiles = 'profiles';
  static const String messages = 'messages';
  static const String getConversations = 'get_conversations';
  static const String profileId = 'id';
  static const String profileFirstName = 'first_name';
  static const String profileLastName = 'last_name';
  static const String messageChatId = 'chat_id';
  static const String messageFromId = 'from_id';
  static const String messageToId = 'to_id';
  static const String messageCreatedAt = 'created_at';
}
