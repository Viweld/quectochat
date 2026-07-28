/// Auth feature public API.
library;

import 'package:auth/auth.gr.dart';
import 'package:shared_core/core.dart';

export 'auth.gr.dart';
export 'domain/repositories/auth_repository.dart';
export 'presentation/login_screen/login_screen.dart';
export 'presentation/registration_screen/registration_screen.dart';
export 'src/di/configure_dependencies.module.dart';

/// Codegen anchor for [LoginRoute] / [RegistrationRoute]. Not used at runtime.
@AutoRouterConfig()
class AuthRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegistrationRoute.page),
  ];
}
