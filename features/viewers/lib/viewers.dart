/// Viewers feature public API — fullscreen media viewers.
library;

import 'package:shared_core/core.dart';
import 'package:viewers/viewers.gr.dart';

export 'presentation/image_viewer_screen/image_viewer_route_builder.dart';
export 'presentation/image_viewer_screen/image_viewer_screen.dart';
export 'src/di/configure_dependencies.module.dart';
export 'viewers.gr.dart';

/// Codegen anchor for [ImageViewerRoute]. Not used at runtime.
@AutoRouterConfig()
class ViewersRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[AutoRoute(page: ImageViewerRoute.page)];
}
