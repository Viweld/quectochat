import 'package:infrastructure/infrastructure.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';

/// Wires [PresencePort] to [PresenceService].
void registerPresencePort(GetIt locator) {
  locator.registerLazySingleton<PresenceService>(PresenceService.new);
  locator.registerLazySingleton<PresencePort>(
    () => _PresencePortAdapter(locator<PresenceService>()),
  );
}

final class _PresencePortAdapter implements PresencePort {
  _PresencePortAdapter(this._presenceService);

  final PresenceService _presenceService;

  @override
  Future<void> startTracking() => _presenceService.startTracking();

  @override
  Future<void> stopTracking() => _presenceService.stopTracking();

  @override
  Stream<Set<String>> get onlineUserIdsStream => _presenceService.onlineUserIdsStream;

  @override
  Stream<DateTime?> watchLastSeenAt(String userId) => _presenceService.watchLastSeenAt(userId);
}
