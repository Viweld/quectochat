part of 'firebase_service.dart';

/// Маппер данных: firebase <-> model
class _Mapper {
  // СОБЕСЕДНИК:
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  /// Парсинг данных пользователя из БД на модель UserDetails
  UserDetails _parseUserDetails(Map<String, Object?> src) {
    return UserDetails(
      id: src[_Keys._fUser$id] as String,
      fullName: src[_Keys._fUser$fullName] as String,
      createdAt: DateTime.parse('${src[_Keys._fUser$createdAt]}'),
    );
  }

  /// Маппинг данных пользователя из UserDetails на структуру для БД
  Map<String, Object?> _mapUserDetails(UserDetails src) => {
        _Keys._fUser$id: src.id,
        _Keys._fUser$fullName: src.fullName,
        _Keys._fUser$createdAt: '${src.createdAt}',
      };

  // СООБЩЕНИЕ:
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  /// Парсинг данных сообщения из БД на модель ChatMessage
  ChatMessage _parseChatMessage({
    required Map<String, Object?> src,
    String? ownId,
  }) {
    final fromId = src[_Keys._fMessage$fromId] as String;
    return ChatMessage(
      fromId: fromId,
      isOwn: fromId == ownId,
      toId: src[_Keys._fMessage$toId] as String,
      content: src[_Keys._fMessage$content] as String,
      type: _parseChatMessageType(src[_Keys._fMessage$type] as String),
      createdAt: DateTime.fromMicrosecondsSinceEpoch(
        src[_Keys._fMessage$timestamp] as int,
      ),
    );
  }

  /// Маппинг данных сообщения из ChatMessage на структуру для БД
  Map<String, Object?> _mapChatMessage(ChatMessage src) => {
        _Keys._fMessage$fromId: src.fromId,
        _Keys._fMessage$toId: src.toId,
        _Keys._fMessage$content: src.content,
        _Keys._fMessage$type: _mapChatMessageType(src.type),
        _Keys._fMessage$timestamp: src.createdAt.microsecondsSinceEpoch,
      };

  /// Парсинг данных типа сообщения из БД на модель ChatMessage
  ChatMessageType _parseChatMessageType(String src) {
    return switch (src) {
      'text' => ChatMessageType.text,
      _ => throw UnsupportedError('Unknown message type in mapper'),
    };
  }

  /// Маппинг данных типа сообщения из ChatMessage на структуру для БД
  String _mapChatMessageType(ChatMessageType src) {
    return switch (src) {
      ChatMessageType.text => 'text',
    };
  }
}
