import 'package:auth/auth.dart';
import 'package:chat/chat.dart';
import 'package:home/home.dart';
import 'package:navigation/navigation.gr.dart';
import 'package:navigation/src/guards/auth_guard.dart';
import 'package:navigation/src/guards/guest_guard.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';
import 'package:viewers/viewers.dart';

@AutoRouterConfig()
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
    CustomRoute<void>(
      page: SplashRoute.page,
      initial: true,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    AutoRoute(page: LoginRoute.page, guards: <AutoRouteGuard>[_guestGuard]),
    AutoRoute(page: InviteCodeRoute.page, guards: <AutoRouteGuard>[_guestGuard]),
    AutoRoute(page: InviteQrScannerRoute.page, guards: <AutoRouteGuard>[_guestGuard]),
    AutoRoute(page: RegistrationRoute.page, guards: <AutoRouteGuard>[_guestGuard]),
    AutoRoute(page: HomeRoute.page, guards: <AutoRouteGuard>[_authGuard]),
    AutoRoute(page: CreateInvitationRoute.page, guards: <AutoRouteGuard>[_authGuard]),
    AutoRoute(page: NestedContactsRoute.page, guards: <AutoRouteGuard>[_authGuard]),
    AutoRoute(page: ChatRoute.page, guards: <AutoRouteGuard>[_authGuard]),
    CustomRoute<void>(
      page: ImageViewerRoute.page,
      guards: <AutoRouteGuard>[_authGuard],
      customRouteBuilder: buildImageViewerRoute,
    ),
  ];

  @override
  Future<void> navigateBack([Object? result]) => maybePop(result);

  @override
  Future<void> navigateLogin() => replaceAll(<PageRouteInfo>[const LoginRoute()]);

  @override
  Future<void> navigateInviteCode() => push(const InviteCodeRoute());

  @override
  Future<String?> navigateInviteQrScanner() => push<String>(const InviteQrScannerRoute());

  @override
  Future<void> navigateRegistration({required String inviteCode}) =>
      push(RegistrationRoute(inviteCode: inviteCode));

  @override
  Future<void> navigateHome() => replaceAll(<PageRouteInfo>[const HomeRoute()]);

  @override
  Future<void> navigateChat({required String interlocutorId, required String displayName}) =>
      push(ChatRoute(interlocutorId: interlocutorId, displayName: displayName));

  @override
  Future<void> navigateNestedContacts({
    required String anchorUserId,
    required String anchorDisplayName,
    required bool isFriendsOfRelative,
  }) => push(
    NestedContactsRoute(
      anchorUserId: anchorUserId,
      anchorDisplayName: anchorDisplayName,
      isFriendsOfRelative: isFriendsOfRelative,
    ),
  );

  @override
  Future<void> navigateCreateInvitation({required String targetRole}) =>
      push(CreateInvitationRoute(targetRole: targetRole));

  @override
  Future<void> navigateImageViewer({
    required List<String> imageUrls,
    required String initialUrl,
    String? heroTag,
  }) {
    if (imageUrls.isEmpty) return Future<void>.value();
    return push(ImageViewerRoute(imageUrls: imageUrls, initialUrl: initialUrl, heroTag: heroTag));
  }
}
