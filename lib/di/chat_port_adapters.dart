import 'package:chat/domain/repositories/chat_repository.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';

/// Wires chat delivery ACK port to [ChatRepository].
void registerChatPorts(GetIt locator) {
  locator.registerLazySingleton<ChatDeliveryAckPort>(
    () => _ChatDeliveryAckPortAdapter(locator<ChatRepository>()),
  );
}

final class _ChatDeliveryAckPortAdapter implements ChatDeliveryAckPort {
  _ChatDeliveryAckPortAdapter(this._chatRepository);

  final ChatRepository _chatRepository;

  @override
  Future<void> startTracking() => _chatRepository.startDeliveryTracking();

  @override
  Future<void> stopTracking() => _chatRepository.stopDeliveryTracking();
}
