import 'dart:developer';

import 'package:flutter/services.dart';

/// Clears system tray / notification center entries for one chat interlocutor.
final class ChatNotificationClearer {
  static const MethodChannel _channel = MethodChannel('dev.viweld.achat/chat_notifications');

  Future<void> clearForInterlocutor(String interlocutorId) async {
    if (interlocutorId.isEmpty) return;

    try {
      await _channel.invokeMethod<void>('clearForInterlocutor', <String, String>{
        'interlocutorId': interlocutorId,
      });
    } on Object catch (error, stackTrace) {
      log(
        'Failed to clear notifications for interlocutor $interlocutorId',
        name: 'ChatNotificationClearer',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}
