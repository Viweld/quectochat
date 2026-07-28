import 'package:auth/auth.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';

/// Redirects unauthenticated users to [LoginRoute].
@injectable
class AuthGuard extends AutoRouteGuard {
  AuthGuard(this._authenticationStatePort);

  final AuthenticationStatePort _authenticationStatePort;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (_authenticationStatePort.authStatus == AuthStatus.authorized) {
      resolver.next();
      return;
    }

    resolver.redirectUntil(const LoginRoute());
  }
}
