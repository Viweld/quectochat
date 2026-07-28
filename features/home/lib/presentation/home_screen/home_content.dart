import 'package:flutter/material.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';
import 'package:shared_ui/core_ui.dart';

import 'bloc/home_bloc.dart';
import 'widgets/chat_tile.dart';
import 'widgets/flexible_header.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key, required this.isFirstLoading, required this.interlocutors});

  final bool isFirstLoading;
  final Iterable<Interlocutor> interlocutors;

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

    return Scaffold(
      body: SafeArea(
        child: CommonPaginationListener(
          onListEnded: () => bloc.add(HomeEvent.onNextPageRequested()),
          listenableChild: CustomScrollView(
            slivers: [
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
                  onExitTapped: () => bloc.add(const HomeEvent.onLogoutTapped()),
                  onSearchFieldClearTapped: () =>
                      bloc.add(const HomeEvent.onSearchFieldClearTapped()),
                  onSearchTextChanged: (String value) =>
                      bloc.add(HomeEvent.onSearchTextChanged(value)),
                ),
              ),
              if (interlocutors.isEmpty)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Values.horizontalPadding),
                      child: Text(
                        context.texts.homeEmptyInterlocutorsMessage,
                        textAlign: TextAlign.center,
                        style: context.caption,
                      ),
                    ),
                  ),
                )
              else
                SliverList.separated(
                  itemCount: interlocutors.length,
                  separatorBuilder: (BuildContext context, int index) => Divider(
                    height: Values.dividerThickness,
                    color: context.palette.gray,
                    indent: Values.horizontalPadding,
                    endIndent: Values.horizontalPadding,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final Interlocutor interlocutor = interlocutors.elementAt(index);
                    return ChatTile(
                      interlocutor: interlocutor,
                      onTapped: () => navigator.navigateChat(
                        interlocutorId: interlocutor.userId,
                        firstName: interlocutor.firstName,
                        lastName: interlocutor.lastName,
                      ),
                      onClearChatRequested: () => bloc.add(
                        HomeEvent.onClearChatRequested(interlocutorId: interlocutor.userId),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
