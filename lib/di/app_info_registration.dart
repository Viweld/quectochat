import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_core/core.dart';

/// Reads build metadata from the bundle and registers it as [AppInfo].
Future<void> registerAppInfo(GetIt locator) async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();

  locator.registerSingleton<AppInfo>(
    AppInfo(version: packageInfo.version, buildNumber: packageInfo.buildNumber),
  );
}
