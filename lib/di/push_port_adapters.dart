import 'package:infrastructure/infrastructure.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';

/// Wires push notification port to infrastructure token store.
void registerPushPorts(GetIt locator) {
  locator.registerLazySingleton<DeviceTokenStore>(DeviceTokenStore.new);
  locator.registerLazySingleton<PushNotificationPort>(
    () => _PushNotificationPortAdapter(locator<DeviceTokenStore>()),
  );
}

final class _PushNotificationPortAdapter implements PushNotificationPort {
  _PushNotificationPortAdapter(this._store);

  final DeviceTokenStore _store;

  @override
  Future<void> registerDeviceToken({required String token, required String platform}) {
    return _store.upsert(token: token, platform: platform);
  }

  @override
  Future<void> unregisterDeviceToken({required String token}) {
    return _store.delete(token: token);
  }
}
