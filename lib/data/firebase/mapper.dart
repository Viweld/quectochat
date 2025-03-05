part of 'firebase_service.dart';

/// Маппер данных: firebase <-> model
class _Mapper {
  /// Парсинг данных пользователя из БД на модель UserDetails
  UserDetails _parseUserDetails(Map<String, Object?> src, String id) {
    return UserDetails(
      id: id,
      fullName: src[_Keys._fUser$fullName] as String,
      createdAt: DateTime.parse('${src[_Keys._fUser$createdAt]}'),
    );
  }

  /// Маппинг данных пользователя из UserDetails на структуру для БД
  Map<String, Object?> _mapUserDetails(UserDetails src) => {
        _Keys._fUser$fullName: src.fullName,
        _Keys._fUser$createdAt: '${src.createdAt}',
      };

  // СООБЩЕНИЕ:
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  /// Парсинг данных сообщения из БД на модель ChatMessage
  Message _parseChatMessage({
    required Map<String, Object?> src,
    required String currentUserId,
    required String messageId,
  }) {
    final fromId = src[_Keys._fMessage$fromId] as String;
    return Message(
      id: messageId,
      chatId: src[_Keys._fMessage$chatId] as String,
      fromId: fromId,
      toId: src[_Keys._fMessage$toId] as String,
      isViewed: src[_Keys._fMessage$isViewed] as bool,
      isOwn: fromId == currentUserId,
      content: src[_Keys._fMessage$content] as String,
      type: _parseChatMessageType(src[_Keys._fMessage$type] as String),
      createdAt: DateTime.fromMicrosecondsSinceEpoch(
        src[_Keys._fMessage$timestamp] as int,
      ),
    );
  }

  /// Парсинг данных типа сообщения из БД на модель ChatMessage
  MessageContentType _parseChatMessageType(String src) {
    return switch (src) {
      'text' => MessageContentType.text,
      'image' => MessageContentType.image,
      _ => throw UnsupportedError('Unknown message type in mapper'),
    };
  }
}
