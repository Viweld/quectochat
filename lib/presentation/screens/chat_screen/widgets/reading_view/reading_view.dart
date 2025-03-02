import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quectochat/domain/environment/builders.dep_gen.dart';
import 'package:quectochat/domain/models/chat_message.dart';

import '../../../../common/common_pending_indicator.dart';
import 'widgets/between_days_divider.dart';
import 'widgets/cluster_attribute.dart';
import 'widgets/empty_messages_placeholder.dart';
import 'widgets/message_bubble.dart';
import 'bloc/reading_view_bloc.dart';
import 'widgets/vertical_message_spacer.dart';

/// КОЛОНКА СООБЩЕНИЙ
class ReadingView extends StatelessWidget {
  const ReadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.depGen().buildReadingViewBloc(),
      child: BlocBuilder<ReadingViewBloc, ReadingViewState>(
        buildWhen: (_, state) => state.maybeMap(
          // TODO(Vadim): #unimplemented добавить обработку состояния ошибки инициализации
          view: (_) => true,
          pending: (_) => true,
          orElse: () => false,
        ),
        builder: (context, state) => state.maybeMap(
          orElse: () => throw UnimplementedError(
            'Wrong state for ReadingView',
          ),
          // TODO(Vadim): #unimplemented добавить обработку состояния ошибки инициализации
          pending: (s) => const Center(child: CommonPendingIndicator()),
          view: (s) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomScrollView(
              reverse: true,
              slivers: [
                /// Либо надпись об отсутствии переписок, либо список переписок
                if (s.messages.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: EmptyMessagesPlaceholder(),
                  )
                else ...[
                  const SliverToBoxAdapter(child: SizedBox(height: 20)),
                  SliverList.separated(
                    itemCount: s.messages.length,
                    itemBuilder: (_, i) => MessageBubble(
                      message: s.messages.elementAt(s.messages.length - 1 - i),
                      clusterAttribute: _getClusterAttribute(s.messages, i),
                    ),
                    separatorBuilder: (_, i) => _isInsideDay(s.messages, i)
                        ? VerticalMessageSpacer(
                            messages: s.messages,
                            builderIndex: i,
                          )
                        : BetweenDaysDivider(
                            message:
                                s.messages.elementAt(s.messages.length - 1 - i),
                          ),
                  ),
                  SliverToBoxAdapter(
                    child: BetweenDaysDivider(message: s.messages.first),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  /// Определяет атрибут кластеризации сообщения (первое, среднее или последнее в группе)
  ClusterAttribute? _getClusterAttribute(
    Iterable<ChatMessage> messages,
    int builderIndex,
  ) {
    final messageList = messages.toList();
    final i = messages.length - 1 - builderIndex;

    final current = messageList[i];
    final prev = i > 0 ? messageList[i - 1] : null;
    final next = i < messageList.length - 1 ? messageList[i + 1] : null;

    final bool hasPrevSameAuthor = prev != null &&
        prev.fromId == current.fromId &&
        _isSameDay(current, prev);
    final bool hasNextSameAuthor = next != null &&
        next.fromId == current.fromId &&
        _isSameDay(current, next);

    if (!hasPrevSameAuthor && !hasNextSameAuthor) return null;
    if (!hasPrevSameAuthor) return ClusterAttribute.first;
    if (!hasNextSameAuthor) return ClusterAttribute.last;
    return ClusterAttribute.middle;
  }

  // ---------------------------------------------------------------------------
  /// Проверяет, написаны ли текущее и предыдущее сообщение в один день
  bool _isInsideDay(Iterable<ChatMessage> messages, int builderIndex) {
    final messageList = messages.toList();
    final i = messages.length - 1 - builderIndex;
    return _isSameDay(messageList[i], messageList[i - 1]);
  }

  // ---------------------------------------------------------------------------
  /// Проверяет, принадлежат ли два сообщения одному дню
  bool _isSameDay(ChatMessage a, ChatMessage b) {
    return a.createdAt.year == b.createdAt.year &&
        a.createdAt.month == b.createdAt.month &&
        a.createdAt.day == b.createdAt.day;
  }
}
