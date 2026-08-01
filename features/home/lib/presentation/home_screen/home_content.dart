import 'package:flutter/material.dart';
import 'package:home/presentation/home_screen/bloc/home_bloc.dart';
import 'package:home/presentation/home_screen/widgets/chat_tile.dart';
import 'package:home/presentation/home_screen/widgets/flexible_header.dart';
import 'package:home/presentation/home_screen/widgets/home_load_error_view.dart';
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
  });

  final bool isFirstLoading;
  final Iterable<Interlocutor> interlocutors;
  final AppErrorViewModel? loadError;

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
                  child: switch (loadError) {
                    final AppErrorViewModel error => HomeLoadErrorView(
                      error: error,
                      onRetryTapped: () => bloc.add(const HomeEvent.onFetchRequested()),
                    ),
                    null => const _HomeEmptyInterlocutorsMessage(),
                  },
                )
              else
                SliverList.separated(
                  itemCount: interlocutors.length,
                  separatorBuilder: (BuildContext context, int index) => Divider(
                    height: Values.dividerThickness,
                    color: context.colors.text.tertiary,
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
