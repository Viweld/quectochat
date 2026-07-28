import 'package:injectable/injectable.dart';
import 'package:navigation/src/app_router/app_router.dart';
import 'package:navigation/src/guards/auth_guard.dart';
import 'package:navigation/src/guards/auth_status_reevaluate_listenable.dart';
import 'package:navigation/src/guards/guest_guard.dart';
import 'package:navigation_api/navigation_api.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  AppRouter appRouter(AuthGuard authGuard, GuestGuard guestGuard) =>
      AppRouter(authGuard: authGuard, guestGuard: guestGuard);

  @lazySingleton
  AuthStatusReevaluateListenable authStatusReevaluateListenable(
    AuthenticationStatePort authenticationStatePort,
  ) => AuthStatusReevaluateListenable(authenticationStatePort);
}
