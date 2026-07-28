/// Postgres table / column names for chat data access.
abstract final class TableKeys {
  static const String messages = 'messages';
  static const String messageId = 'id';
  static const String messageChatId = 'chat_id';
  static const String messageFromId = 'from_id';
  static const String messageToId = 'to_id';
  static const String messageContent = 'content';
  static const String messageType = 'type';
  static const String messageIsViewed = 'is_viewed';
  static const String messageCreatedAt = 'created_at';
}
