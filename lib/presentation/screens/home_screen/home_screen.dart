import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quectochat/domain/environment/builders.dep_gen.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';
import 'package:quectochat/presentation/common/common_text_field.dart';
import 'package:quectochat/presentation/values/qicons.dart';

import '../../../domain/models/interlocutor.dart';
import '../../common/common_pagination_listener.dart';
import '../../common/common_pending_indicator.dart';
import '../../common/common_toast.dart';
import '../../common/common_user_avatar.dart';
import '../../navigation/nested_navigation/nested_routes.dart';
import '../../values/values.dart';
import '../chat_screen/chat_screen_arguments.dart';
import 'bloc/home_bloc.dart';
import 'widgets/swipe_clear_wrapper.dart';

part 'widgets/flexible_header.dart';

part 'widgets/chat_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => context.depGen().buildHomeBloc(),
        child: BlocConsumer<HomeBloc, HomeState>(
          listenWhen: (_, state) => state.maybeMap(
            requestError: (_) => true,
            orElse: () => false,
          ),
          buildWhen: (_, state) => state.maybeMap(
            view: (_) => true,
            pending: (_) => true,
            orElse: () => false,
          ),
          listener: (context, state) => state.mapOrNull(
            requestError: (s) => _requestError(context, s.errorText),
          ),
          builder: (context, state) => state.maybeMap(
            orElse: () => throw UnimplementedError(
              'Wrong state for HomeScreen',
            ),
            pending: (s) => const Center(child: CommonPendingIndicator()),
            view: (s) => _HomeView(interlocutors: s.interlocutors),
          ),
        ),
      ),
    );
  }

  void _requestError(BuildContext context, String? errorText) {
    CommonToast.showError(
      context,
      text: errorText ?? context.texts.commonRequestError,
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({
    required this.interlocutors,
  });

  final Iterable<Interlocutor> interlocutors;

  @override
  Widget build(BuildContext context) {
    final titleHeight = context.style32w600$mainTitle?.height ?? 0;
    final titleSize = context.style32w600$mainTitle?.fontSize ?? 0;
    final scaledTitleFontSize =
        MediaQuery.textScalerOf(context).scale(titleHeight * titleSize);
    final flexibleAppBarHeight = _FlexibleHeader.toTitlePadding +
        _FlexibleHeader.toFieldPadding +
        _FlexibleHeader.toDividerPadding +
        Values.textFieldHeight +
        titleHeight * scaledTitleFontSize +
        Values.dividerThickness +
        1;

    return SafeArea(
      child: CommonPaginationListener(
        onListEnded: () => _onNextPageRequested(context),
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
              flexibleSpace: _FlexibleHeader(
                onExitTapped: () => _onLogoutTapped(context),
                onSearchFieldClearTapped: () =>
                    _onSearchFieldClearTapped(context),
                onSearchTextChanged: (val) =>
                    _onSearchTextChanged(context, val),
              ),
            ),

            /// Либо надпись об отсутствии переписок, либо список переписок
            if (interlocutors.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Values.horizontalPadding,
                    ),
                    child: Text(
                      // TODO(Vadim): #localization
                      'Не с кем переписываться',
                      textAlign: TextAlign.center,
                      style: context.style12w500$labels,
                    ),
                  ),
                ),
              )
            else
              SliverList.separated(
                itemCount: interlocutors.length,
                separatorBuilder: (context, i) => Divider(
                  height: Values.dividerThickness,
                  color: context.palette.gray,
                  indent: Values.horizontalPadding,
                  endIndent: Values.horizontalPadding,
                ),
                itemBuilder: (context, i) {
                  final interlocutor = interlocutors.elementAt(i);
                  return _ChatTile(
                    interlocutor: interlocutor,
                    onTapped: () => _onChatListItemTapped(
                      context,
                      interlocutor,
                    ),
                    onClearChatRequested: () => _onClearChatRequested(
                      context,
                      interlocutor,
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  // КОЛЛБЭКИ от действий пользователя:
  // ---------------------------------------------------------------------------
  void _onLogoutTapped(BuildContext context) {
    context.read<HomeBloc>().add(const HomeEvent.onLogoutTapped());
  }

  void _onChatListItemTapped(BuildContext context, Interlocutor interlocutor) {
    Navigator.pushNamed(
      context,
      NestedRoutes.routeChat,
      arguments: ChatScreenArguments(
        id: interlocutor.userId,
        firstName: interlocutor.firstName,
        lastName: interlocutor.lastName,
      ),
    );
  }

  void _onSearchFieldClearTapped(BuildContext context) {
    context.read<HomeBloc>().add(const HomeEvent.onSearchFieldClearTapped());
  }

  void _onSearchTextChanged(BuildContext context, String val) {
    context.read<HomeBloc>().add(HomeEvent.onSearchTextChanged(val));
  }

  void _onClearChatRequested(BuildContext context, Interlocutor interlocutor) {
    context.read<HomeBloc>().add(
          HomeEvent.onClearChatRequested(interlocutorId: interlocutor.userId),
        );
  }

  void _onNextPageRequested(BuildContext context) {
    context.read<HomeBloc>().add(HomeEvent.onNextPageRequested());
  }
}
