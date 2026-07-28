/// Chat feature public API.
library;

import 'package:chat/chat.gr.dart';
import 'package:shared_core/core.dart';

export 'chat.gr.dart';
export 'presentation/chat_screen/chat_screen.dart';
export 'src/di/configure_dependencies.module.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class ChatRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[AutoRoute(page: ChatRoute.page)];
}
