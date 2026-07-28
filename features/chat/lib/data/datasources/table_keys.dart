/// Postgres table / column names for chat data access.
abstract final class TableKeys {
  static const messages = 'messages';
  static const messageId = 'id';
  static const messageChatId = 'chat_id';
  static const messageFromId = 'from_id';
  static const messageToId = 'to_id';
  static const messageContent = 'content';
  static const messageType = 'type';
  static const messageIsViewed = 'is_viewed';
  static const messageCreatedAt = 'created_at';
}
