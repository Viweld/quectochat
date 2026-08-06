import 'package:flutter/material.dart';
import 'package:home/domain/entities/current_user.dart';
import 'package:home/presentation/home_screen/bloc/home_bloc.dart';
import 'package:home/presentation/home_screen/widgets/home_drawer/home_drawer.dart';
import 'package:home/presentation/home_screen/widgets/home_empty_interlocutors_view.dart';
import 'package:home/presentation/home_screen/widgets/home_flexible_header/home_flexible_header.dart';
import 'package:home/presentation/home_screen/widgets/home_interlocutors_sliver.dart';
import 'package:home/presentation/home_screen/widgets/home_load_error_view.dart';
import 'package:home/presentation/home_screen/widgets/invite_role_bottom_sheet/invite_role_bottom_sheet.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';
import 'package:shared_ui/core_ui.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
    required this.isFirstLoading,
    required this.interlocutors,
    required this.loadError,
    required this.currentUser,
    required this.isLogoutLoading,
  });

  final bool isFirstLoading;
  final Iterable<Interlocutor> interlocutors;
  final AppErrorViewModel? loadError;
  final CurrentUser? currentUser;
  final bool isLogoutLoading;

  @override
  Widget build(BuildContext context) {
    if (isFirstLoading && interlocutors.isEmpty) {
      return const Scaffold(body: Center(child: AppPendingIndicator()));
    }

    final HomeBloc bloc = context.read<HomeBloc>();
    final AppNavigator navigator = appLocator<AppNavigator>();
    final CurrentUser? currentUser = this.currentUser;
    final List<Interlocutor> items = interlocutors.toList(growable: false);

    return Scaffold(
      drawer: HomeDrawer(
        displayName: currentUser?.displayName ?? '',
        canInvite: currentUser?.canInvite ?? false,
        isLogoutPending: isLogoutLoading,
        onProfileTapped: () => _showComingSoon(context),
        onAddUserTapped: () => _onAddUserTapped(
          context,
          navigator: navigator,
          canInviteFamilyMembers: currentUser?.canInviteFamilyMembers ?? false,
        ),
        onLogoutTapped: () => bloc.add(const HomeEvent.onLogoutTapped()),
      ),
      body: SafeArea(
        // Builder даёт контекст под Scaffold — из него открывается дравер.
        child: Builder(
          builder: (BuildContext scaffoldContext) => AppPaginationListener(
            onListEnded: () => bloc.add(const HomeEvent.onNextPageRequested()),
            listenableChild: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  scrolledUnderElevation: 0,
                  forceMaterialTransparency: true,
                  floating: true,
                  snap: true,
                  pinned: true,
                  collapsedHeight: 0,
                  toolbarHeight: 0,
                  expandedHeight: HomeFlexibleHeader.expandedHeight,
                  flexibleSpace: HomeFlexibleHeader(
                    onMenuTapped: () => Scaffold.of(scaffoldContext).openDrawer(),
                    onSearchFieldClearTapped: () =>
                        bloc.add(const HomeEvent.onSearchFieldClearTapped()),
                    onSearchTextChanged: (String value) =>
                        bloc.add(HomeEvent.onSearchTextChanged(value)),
                  ),
                ),
                if (items.isEmpty)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: switch (loadError) {
                      final AppErrorViewModel error => HomeLoadErrorView(
                        error: error,
                        onRetryTapped: () => bloc.add(const HomeEvent.onFetchRequested()),
                      ),
                      null => const HomeEmptyInterlocutorsView(),
                    },
                  )
                else
                  HomeInterlocutorsSliver(
                    interlocutors: items,
                    currentUser: currentUser,
                    navigator: navigator,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onAddUserTapped(
    BuildContext context, {
    required AppNavigator navigator,
    required bool canInviteFamilyMembers,
  }) {
    if (canInviteFamilyMembers) {
      InviteRoleBottomSheet.show(
        context,
        onRoleSelected: (String role) => navigator.navigateCreateInvitation(targetRole: role),
      );
      return;
    }
    navigator.navigateCreateInvitation(targetRole: 'friend');
  }

  void _showComingSoon(BuildContext context) {
    appLocator<AppToastBus>().fire(AppToastEvent.info(context.texts.homeDrawerComingSoonMessage));
  }
}
