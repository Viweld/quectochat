import 'package:auth/auth.dart';
import 'package:chat/chat.dart';
import 'package:home/home.dart';
import 'package:infrastructure/infrastructure.dart';
import 'package:navigation/navigation.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:quectochat/di/app_di.config.dart';
import 'package:quectochat/di/auth_port_adapters.dart';
import 'package:quectochat/di/badge_port_adapters.dart';
import 'package:quectochat/di/chat_notification_clear_port_adapters.dart';
import 'package:quectochat/di/chat_port_adapters.dart';
import 'package:quectochat/di/presence_port_adapters.dart';
import 'package:quectochat/di/push_port_adapters.dart';
import 'package:shared_core/core.dart';

@InjectableInit(
  preferRelativeImports: true,
  externalPackageModulesAfter: <ExternalModule>[
    ExternalModule(SharedCorePackageModule),
    ExternalModule(InfrastructurePackageModule),
    ExternalModule(NavigationPackageModule),
    ExternalModule(AuthPackageModule),
    ExternalModule(HomePackageModule),
    ExternalModule(ChatPackageModule),
  ],
)
Future<void> configureDependencies() async {
  await appLocator.reset();
  await appLocator.init();
  registerPushPorts(appLocator);
  registerBadgePorts(appLocator);
  registerChatNotificationClearPorts(appLocator);
  registerAuthPorts(appLocator);
  registerChatPorts(appLocator);
  registerPresencePort(appLocator);

  if (!appLocator.isRegistered<AppNavigator>()) {
    appLocator.registerLazySingleton<AppNavigator>(appLocator.get<AppRouter>);
  }
}
