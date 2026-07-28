import 'package:flutter/material.dart';
import 'package:shared_core/core.dart';
import 'package:chat/domain/entities/message.dart';

import 'widgets/between_days_divider.dart';
import 'widgets/cluster_attribute.dart';
import 'widgets/empty_messages_placeholder.dart';
import 'widgets/message_bubble.dart';
import 'bloc/reading_view_bloc.dart';
import 'widgets/vertical_message_spacer.dart';
import 'package:shared_ui/core_ui.dart';

/// КОЛОНКА СООБЩЕНИЙ
class ReadingView extends StatelessWidget {
  const ReadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appLocator<ReadingViewBloc>(),
      child: BlocBuilder<ReadingViewBloc, ReadingViewState>(
        builder: (BuildContext context, ReadingViewState state) {
          if (state.isPending) {
            return const Center(child: CommonPendingIndicator());
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomScrollView(
              reverse: true,
              slivers: [
                if (state.messages.isEmpty)
                  const SliverFillRemaining(hasScrollBody: false, child: EmptyMessagesPlaceholder())
                else ...[
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
          );
        },
      ),
    );
  }

  // ---------------------------------------------------------------------------
  /// Определяет атрибут кластеризации сообщения (первое, среднее или последнее в группе)
  ClusterAttribute? _getClusterAttribute(Iterable<Message> messages, int builderIndex) {
    final messageList = messages.toList();
    final i = messages.length - 1 - builderIndex;

    final current = messageList[i];
    final prev = i > 0 ? messageList[i - 1] : null;
    final next = i < messageList.length - 1 ? messageList[i + 1] : null;

    final bool hasPrevSameAuthor =
        prev != null && prev.fromId == current.fromId && _isSameDay(current, prev);
    final bool hasNextSameAuthor =
        next != null && next.fromId == current.fromId && _isSameDay(current, next);

    if (!hasPrevSameAuthor && !hasNextSameAuthor) return null;
    if (!hasPrevSameAuthor) return ClusterAttribute.first;
    if (!hasNextSameAuthor) return ClusterAttribute.last;
    return ClusterAttribute.middle;
  }

  // ---------------------------------------------------------------------------
  /// Проверяет, написаны ли текущее и предыдущее сообщение в один день
  bool _isInsideDay(Iterable<Message> messages, int builderIndex) {
    final messageList = messages.toList();
    final i = messages.length - 1 - builderIndex;
    return _isSameDay(messageList[i], messageList[i - 1]);
  }

  // ---------------------------------------------------------------------------
  /// Проверяет, принадлежат ли два сообщения одному дню
  bool _isSameDay(Message a, Message b) {
    return a.createdAt.year == b.createdAt.year &&
        a.createdAt.month == b.createdAt.month &&
        a.createdAt.day == b.createdAt.day;
  }
}
