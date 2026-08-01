/// Postgres table / column names for chat data access.
abstract final class TableKeys {
  static const String messages = 'messages';
  static const String messageId = 'id';
  static const String messageChatId = 'chat_id';
  static const String messageFromId = 'from_id';
  static const String messageToId = 'to_id';
  static const String messageContent = 'content';
  static const String messageType = 'type';
  static const String messageDeliveredAt = 'delivered_at';
  static const String messageReadAt = 'read_at';
  static const String messageCreatedAt = 'created_at';

  static const String activeChats = 'active_chats';
  static const String activeChatUserId = 'user_id';
  static const String activeChatInterlocutorId = 'interlocutor_id';
  static const String activeChatUpdatedAt = 'updated_at';
}
