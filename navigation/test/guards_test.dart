import 'package:auto_route/auto_route.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:navigation/src/guards/auth_guard.dart';
import 'package:navigation/src/guards/guest_guard.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_domain/shared_domain.dart';

class _MockAuthenticationStatePort extends Mock implements AuthenticationStatePort {}

class _MockNavigationResolver extends Mock implements NavigationResolver {}

class _MockStackRouter extends Mock implements StackRouter {}

class _FakePageRouteInfo extends Fake implements PageRouteInfo {}

void main() {
  late _MockAuthenticationStatePort authPort;
  late _MockNavigationResolver resolver;
  late _MockStackRouter router;

  setUpAll(() {
    registerFallbackValue(_FakePageRouteInfo());
  });

  setUp(() {
    authPort = _MockAuthenticationStatePort();
    resolver = _MockNavigationResolver();
    router = _MockStackRouter();
    when(() => resolver.next()).thenReturn(null);
    when(() => resolver.redirectUntil(any())).thenAnswer((_) async {});
  });

  group('AuthGuard', () {
    test('allows navigation when authorized', () {
      when(() => authPort.authStatus).thenReturn(AuthStatus.authorized);
      AuthGuard(authPort).onNavigation(resolver, router);
      verify(() => resolver.next()).called(1);
      verifyNever(() => resolver.redirectUntil(any()));
    });

    test('redirects to login when not authorized', () {
      when(() => authPort.authStatus).thenReturn(AuthStatus.notAuthorized);
      AuthGuard(authPort).onNavigation(resolver, router);
      verify(() => resolver.redirectUntil(any())).called(1);
      verifyNever(() => resolver.next());
    });
  });

  group('GuestGuard', () {
    test('allows navigation when not authorized', () {
      when(() => authPort.authStatus).thenReturn(AuthStatus.notAuthorized);
      GuestGuard(authPort).onNavigation(resolver, router);
      verify(() => resolver.next()).called(1);
      verifyNever(() => resolver.redirectUntil(any()));
    });

    test('redirects to home when authorized', () {
      when(() => authPort.authStatus).thenReturn(AuthStatus.authorized);
      GuestGuard(authPort).onNavigation(resolver, router);
      verify(() => resolver.redirectUntil(any())).called(1);
      verifyNever(() => resolver.next());
    });
  });
}
