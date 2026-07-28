/// Home feature public API.
library;

import 'package:home/home.gr.dart';
import 'package:shared_core/core.dart';

export 'home.gr.dart';
export 'presentation/home_screen/home_screen.dart';
export 'src/di/configure_dependencies.module.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class HomeRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[AutoRoute(page: HomeRoute.page)];
}
