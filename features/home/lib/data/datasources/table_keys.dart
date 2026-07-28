/// Postgres table / column / RPC names for home data access.
abstract final class TableKeys {
  static const profiles = 'profiles';
  static const messages = 'messages';
  static const getConversations = 'get_conversations';
  static const profileId = 'id';
  static const profileFirstName = 'first_name';
  static const profileLastName = 'last_name';
  static const messageChatId = 'chat_id';
  static const messageFromId = 'from_id';
  static const messageToId = 'to_id';
  static const messageCreatedAt = 'created_at';
}
