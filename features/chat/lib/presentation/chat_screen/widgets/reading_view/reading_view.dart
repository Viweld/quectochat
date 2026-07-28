import 'package:chat/domain/entities/message.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/bloc/reading_view_bloc.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/widgets/between_days_divider.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/widgets/cluster_attribute.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/widgets/empty_messages_placeholder.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/widgets/message_bubble.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/widgets/vertical_message_spacer.dart';
import 'package:flutter/material.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

class ReadingView extends StatelessWidget {
  const ReadingView({required this.interlocutorId, super.key});

  final String interlocutorId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReadingViewBloc>(
      create: (BuildContext context) => appLocator<ReadingViewBloc>(param1: interlocutorId),
      child: BlocBuilder<ReadingViewBloc, ReadingViewState>(
        builder: (BuildContext context, ReadingViewState state) {
          if (state.isPending) {
            return const Center(child: CommonPendingIndicator());
          }

          return CommonPaginationListener(
            onListEnded: () =>
                context.read<ReadingViewBloc>().add(const ReadingViewEvent.onNextPageRequested()),
            listenableChild: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomScrollView(
                reverse: true,
                slivers: <Widget>[
                  if (state.messages.isEmpty)
                    const SliverFillRemaining(
                      hasScrollBody: false,
                      child: EmptyMessagesPlaceholder(),
                    )
                  else ...<Widget>[
                    const SliverToBoxAdapter(child: SizedBox(height: 20)),
                    SliverList.separated(
                      itemCount: state.messages.length,
                      itemBuilder: (_, int i) => MessageBubble(
                        message: state.messages.elementAt(state.messages.length - 1 - i),
                        clusterAttribute: _getClusterAttribute(state.messages, i),
                      ),
                      separatorBuilder: (_, int i) => _isInsideDay(state.messages, i)
                          ? VerticalMessageSpacer(messages: state.messages, builderIndex: i)
                          : BetweenDaysDivider(
                              message: state.messages.elementAt(state.messages.length - 1 - i),
                            ),
                    ),
                    SliverToBoxAdapter(child: BetweenDaysDivider(message: state.messages.first)),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  ClusterAttribute? _getClusterAttribute(Iterable<Message> messages, int builderIndex) {
    final List<Message> messageList = messages.toList();
    final int i = messages.length - 1 - builderIndex;

    final Message current = messageList[i];
    final Message? prev = i > 0 ? messageList[i - 1] : null;
    final Message? next = i < messageList.length - 1 ? messageList[i + 1] : null;

    final bool hasPrevSameAuthor =
        prev != null && prev.fromId == current.fromId && _isSameDay(current, prev);
    final bool hasNextSameAuthor =
        next != null && next.fromId == current.fromId && _isSameDay(current, next);

    if (!hasPrevSameAuthor && !hasNextSameAuthor) return null;
    if (!hasPrevSameAuthor) return ClusterAttribute.first;
    if (!hasNextSameAuthor) return ClusterAttribute.last;
    return ClusterAttribute.middle;
  }

  bool _isInsideDay(Iterable<Message> messages, int builderIndex) {
    final List<Message> messageList = messages.toList();
    final int i = messages.length - 1 - builderIndex;
    return _isSameDay(messageList[i], messageList[i - 1]);
  }

  bool _isSameDay(Message a, Message b) {
    return a.createdAt.year == b.createdAt.year &&
        a.createdAt.month == b.createdAt.month &&
        a.createdAt.day == b.createdAt.day;
  }
}
