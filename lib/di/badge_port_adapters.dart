import 'package:infrastructure/infrastructure.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';

/// Wires [BadgeSyncPort] to [BadgeSyncService].
void registerBadgePorts(GetIt locator) {
  locator.registerLazySingleton<BadgeSyncService>(BadgeSyncService.new);
  locator.registerLazySingleton<BadgeSyncPort>(
    () => _BadgeSyncPortAdapter(locator<BadgeSyncService>()),
  );
}

final class _BadgeSyncPortAdapter implements BadgeSyncPort {
  _BadgeSyncPortAdapter(this._service);

  final BadgeSyncService _service;

  @override
  Future<void> startTracking() => _service.startTracking();

  @override
  Future<void> stopTracking() => _service.stopTracking();
}
