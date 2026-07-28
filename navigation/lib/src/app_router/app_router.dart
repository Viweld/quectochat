import 'package:auth/auth.dart';
import 'package:chat/chat.dart';
import 'package:home/home.dart';
import 'package:navigation/navigation.gr.dart';
import 'package:navigation/src/guards/auth_guard.dart';
import 'package:navigation/src/guards/guest_guard.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter implements AppNavigator {
  AppRouter({required AuthGuard authGuard, required GuestGuard guestGuard})
    : _authGuard = authGuard,
      _guestGuard = guestGuard,
      routeObserver = AutoRouteObserver();

  final AutoRouteObserver routeObserver;
  final AuthGuard _authGuard;
  final GuestGuard _guestGuard;

  @override
  List<AutoRoute> get routes => <AutoRoute>[
    CustomRoute(
      page: SplashRoute.page,
      initial: true,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    AutoRoute(page: LoginRoute.page, guards: <AutoRouteGuard>[_guestGuard]),
    AutoRoute(page: RegistrationRoute.page, guards: <AutoRouteGuard>[_guestGuard]),
    AutoRoute(page: HomeRoute.page, guards: <AutoRouteGuard>[_authGuard]),
    AutoRoute(page: ChatRoute.page, guards: <AutoRouteGuard>[_authGuard]),
  ];

  @override
  Future<void> navigateBack([Object? result]) => maybePop(result);

  @override
  Future<void> navigateLogin() => replaceAll(<PageRouteInfo>[const LoginRoute()]);

  @override
  Future<void> navigateRegistration() => push(const RegistrationRoute());

  @override
  Future<void> navigateHome() => replaceAll(<PageRouteInfo>[const HomeRoute()]);

  @override
  Future<void> navigateChat({
    required String interlocutorId,
    required String firstName,
    required String lastName,
  }) => push(ChatRoute(interlocutorId: interlocutorId, firstName: firstName, lastName: lastName));
}
