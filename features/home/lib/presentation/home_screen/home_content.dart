import 'package:flutter/material.dart';
import 'package:home/domain/entities/current_user.dart';
import 'package:home/presentation/home_screen/bloc/home_bloc.dart';
import 'package:home/presentation/home_screen/widgets/chat_tile.dart';
import 'package:home/presentation/home_screen/widgets/flexible_header.dart';
import 'package:home/presentation/home_screen/widgets/home_drawer/home_drawer.dart';
import 'package:home/presentation/home_screen/widgets/home_load_error_view.dart';
import 'package:home/presentation/home_screen/widgets/invite_role_bottom_sheet.dart';
import 'package:home/presentation/home_screen/widgets/pinned_interlocutor_tile.dart';
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
      return const Scaffold(body: Center(child: CommonPendingIndicator()));
    }

    final HomeBloc bloc = context.read<HomeBloc>();
    final AppNavigator navigator = appLocator<AppNavigator>();
    final double titleHeight = context.mainTitle?.height ?? 0;
    final double titleSize = context.mainTitle?.fontSize ?? 0;
    final double scaledTitleFontSize = MediaQuery.textScalerOf(
      context,
    ).scale(titleHeight * titleSize);
    final double flexibleAppBarHeight =
        FlexibleHeader.toTitlePadding +
        FlexibleHeader.toFieldPadding +
        FlexibleHeader.toDividerPadding +
        Values.textFieldHeight +
        titleHeight * scaledTitleFontSize +
        Values.dividerThickness +
        1;

    final CurrentUser? currentUser = this.currentUser;
    final bool canInvite = currentUser?.canInvite ?? false;
    final bool canInviteFamilyMembers = currentUser?.canInviteFamilyMembers ?? false;
    final List<Interlocutor> items = interlocutors.toList(growable: false);

    return Scaffold(
      drawer: HomeDrawer(
        displayName: currentUser?.displayName ?? '',
        canInvite: canInvite,
        isLogoutPending: isLogoutLoading,
        onProfileTapped: () => _showComingSoon(context),
        onAddUserTapped: () => _onAddUserTapped(
          context,
          navigator: navigator,
          canInviteFamilyMembers: canInviteFamilyMembers,
        ),
        onLogoutTapped: () => bloc.add(const HomeEvent.onLogoutTapped()),
      ),
      body: SafeArea(
        // Builder даёт контекст под Scaffold — из него открывается дравер.
        child: Builder(
          builder: (BuildContext scaffoldContext) => CommonPaginationListener(
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
                  expandedHeight: flexibleAppBarHeight,
                  flexibleSpace: FlexibleHeader(
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
                      null => const _HomeEmptyInterlocutorsMessage(),
                    },
                  )
                else
                  SliverList(
                    delegate: SliverChildBuilderDelegate(childCount: items.length, (
                      BuildContext context,
                      int index,
                    ) {
                      final Interlocutor item = items[index];

                      void openChat() => navigator.navigateChat(
                        interlocutorId: item.userId,
                        displayName: item.displayName,
                      );

                      if (item.isPinned) {
                        return PinnedInterlocutorTile(
                          interlocutor: item,
                          receivesHeaderShadow: index == 0,
                          onChatTapped: openChat,
                          onRevealNestedTapped: () => navigator.navigateNestedContacts(
                            anchorUserId: item.userId,
                            anchorDisplayName: item.displayName,
                            isFriendsOfRelative: currentUser?.familyRole != null,
                          ),
                        );
                      }
                      return ChatTile(
                        interlocutor: item,
                        onTapped: openChat,
                      );
                    }),
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

final class _HomeEmptyInterlocutorsMessage extends StatelessWidget {
  const _HomeEmptyInterlocutorsMessage();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Values.horizontalPadding),
        child: Text(
          context.texts.homeEmptyInterlocutorsMessage,
          textAlign: TextAlign.center,
          style: context.caption,
        ),
      ),
    );
  }
}
