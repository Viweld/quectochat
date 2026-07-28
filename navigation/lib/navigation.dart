/// Navigation package public API.
library;

import 'package:auto_route/auto_route.dart';
import 'package:navigation/navigation.gr.dart';

export 'navigation.gr.dart';
export 'src/app_router/app_router.dart';
export 'src/di/configure_dependencies.module.dart';
export 'src/guards/auth_guard.dart';
export 'src/guards/auth_status_reevaluate_listenable.dart';
export 'src/guards/guest_guard.dart';
export 'src/presentation/splash_screen/splash_screen.dart';

/// Codegen anchor for [SplashRoute]. Not used at runtime.
@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class NavigationRoutes extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[AutoRoute(page: SplashRoute.page)];
}
