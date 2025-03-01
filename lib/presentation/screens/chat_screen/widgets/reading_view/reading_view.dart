import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quectochat/domain/environment/builders.dep_gen.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';
import 'package:quectochat/domain/models/chat_message.dart';

import '../../../../common/common_pending_indicator.dart';
import '../../../../values/values.dart';
import 'widgets/cluster_attribute.dart';
import 'widgets/message_bubble.dart';
import 'bloc/reading_view_bloc.dart';

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
                    child: _EmptyMessagesPlaceholder(),
                  )
                else ...[
                  const SliverToBoxAdapter(child: SizedBox(height: 20)),
                  SliverList.separated(
                    itemCount: s.messages.length,
                    separatorBuilder: (_, i) => SizedBox(
                      height: _getInterval(s.messages, i),
                    ),
                    itemBuilder: (_, i) => MessageBubble(
                      message: s.messages.elementAt(s.messages.length - 1 - i),
                      clusterAttribute: _getClusterAttribute(s.messages, i),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  ClusterAttribute? _getClusterAttribute(
    Iterable<ChatMessage> messages,
    int i,
  ) {
    final messageList = messages.toList().reversed.toList();
    //if (i < 0 || i >= messageList.length) return null;

    final current = messageList[i];
    final next = i > 0 ? messageList[i - 1] : null;
    final prev = i < messageList.length - 1 ? messageList[i + 1] : null;

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

  bool _isSameDay(ChatMessage a, ChatMessage b) {
    return a.createdAt.year == b.createdAt.year &&
        a.createdAt.month == b.createdAt.month &&
        a.createdAt.day == b.createdAt.day;
  }

  double _getInterval(Iterable<ChatMessage> messages, int i) {
    final messageList = messages.toList().reversed.toList();
    if (i >= messageList.length) return 20.0;

    final current = messageList[i];
    final prev = messageList[i + 1];

    final bool hasPrevSameAuthor =
        prev.fromId == current.fromId && _isSameDay(prev, current);

    return hasPrevSameAuthor ? 6.0 : 20.0;
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
/// Надпись об отсутствии переписок "Вы еще не начали переписку..."
class _EmptyMessagesPlaceholder extends StatelessWidget {
  const _EmptyMessagesPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Values.horizontalPadding,
        ),
        child: Text(
          context.texts.chatEmptyMessagesPlaceholder,
          textAlign: TextAlign.center,
          style: context.style12w500$labels,
        ),
      ),
    );
  }
}
