import 'package:home/home.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';

/// Redirects authenticated users away from guest-only routes (login/registration).
@injectable
class GuestGuard extends AutoRouteGuard {
  GuestGuard(this._authenticationStatePort);

  final AuthenticationStatePort _authenticationStatePort;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (_authenticationStatePort.authStatus != AuthStatus.authorized) {
      resolver.next();
      return;
    }

    resolver.redirectUntil(const HomeRoute());
  }
}
