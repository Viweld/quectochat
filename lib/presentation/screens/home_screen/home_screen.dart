import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quectochat/domain/environment/builders.dep_gen.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';
import 'package:quectochat/presentation/common/common_text_field.dart';
import 'package:string_to_color/string_to_color.dart';

import '../../../domain/models/chat_list_item.dart';
import '../../common/common_toast.dart';
import '../../values/values.dart';
import 'bloc/home_bloc.dart';

part 'widgets/flexible_header.dart';

part 'widgets/chat_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
          pending: (s) => const CircularProgressIndicator(),
          view: (s) => _HomeView(chatList: s.chatList),
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
    required this.chatList,
  });

  final Iterable<ChatListItem> chatList;

  @override
  Widget build(BuildContext context) {
    final titleHeight = context.style32w600$mainTitle?.height ?? 0;
    final titleSize = context.style32w600$mainTitle?.fontSize ?? 0;
    // fixme - доделать адаптив при масштабировании текста
    final scaleFactor = MediaQuery.textScalerOf(context).scale(titleSize);
    final flexibleAppBarHeight = _FlexibleHeader.toTitlePadding +
        _FlexibleHeader.toFieldPadding +
        _FlexibleHeader.toDividerPadding +
        CommonEditField.height +
        titleHeight * titleSize * scaleFactor +
        1;

    return Scaffold(
      body: CustomScrollView(
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
            systemOverlayStyle: SystemUiOverlayStyle.light,
            flexibleSpace: _FlexibleHeader(
              onExitTapped: () => _onMenuTapped(context),
              onSearchFieldClearTapped: () =>
                  _onSearchFieldClearTapped(context),
              onSearchTextChanged: (val) => _onSearchTextChanged(context, val),
            ),
          ),

          /// Либо надпись об отсутствии переписок, либо список переписок
          if (chatList.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Values.horizontalPadding,
                  ),
                  child: Text(
                    'Вы еще не начали переписку...',
                    textAlign: TextAlign.center,
                    style: context.style12w500$labels,
                  ),
                ),
              ),
            )
          else
            SliverList.separated(
              itemCount: chatList.length,
              separatorBuilder: (context, i) => Divider(
                height: 1,
                color: context.palette.gray,
                indent: Values.horizontalPadding,
                endIndent: Values.horizontalPadding,
              ),
              itemBuilder: (context, i) {
                final chatLIstItem = chatList.elementAt(i);
                return _ChatTile(
                  chatListItem: chatLIstItem,
                  onTapped: () => _onChatListItemTapped(
                    context,
                    chatLIstItem,
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  // КОЛЛБЭКИ от действий пользователя:
  // ---------------------------------------------------------------------------
  void _onLogoutTapped(BuildContext context) {
    // TODO(Vadim): #unimplemented
    context.read<HomeBloc>().add(const HomeEvent.onLogoutTapped());
  }

  void _onChatListItemTapped(BuildContext context, ChatListItem chatLIstItem) {
    // TODO(Vadim): #unimplemented
  }

  _onMenuTapped(BuildContext context) {
    // TODO(Vadim): #unimplemented
  }

  _onSearchFieldClearTapped(BuildContext context) {
    // TODO(Vadim): #unimplemented
  }

  _onSearchTextChanged(BuildContext context, String val) {
    // TODO(Vadim): #unimplemented
  }
}
