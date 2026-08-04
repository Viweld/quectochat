import 'package:infrastructure/infrastructure.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';

/// Wires [ChatNotificationClearPort] to [ChatNotificationClearer].
void registerChatNotificationClearPorts(GetIt locator) {
  locator.registerLazySingleton<ChatNotificationClearer>(ChatNotificationClearer.new);
  locator.registerLazySingleton<ChatNotificationClearPort>(
    () => _ChatNotificationClearPortAdapter(locator<ChatNotificationClearer>()),
  );
}

final class _ChatNotificationClearPortAdapter implements ChatNotificationClearPort {
  _ChatNotificationClearPortAdapter(this._clearer);

  final ChatNotificationClearer _clearer;

  @override
  Future<void> clearForInterlocutor(String interlocutorId) {
    return _clearer.clearForInterlocutor(interlocutorId);
  }
}
