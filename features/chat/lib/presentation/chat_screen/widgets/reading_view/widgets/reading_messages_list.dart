import 'package:chat/domain/entities/message.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/bloc/reading_view_bloc.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/widgets/between_days_divider.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/widgets/cluster_attribute.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/widgets/empty_messages_placeholder.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/widgets/message_bubble.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/widgets/scroll_to_latest_button.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/widgets/vertical_message_spacer.dart';
import 'package:flutter/material.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

/// Reverse chat list with lazy older-page loading and jump-to-latest FAB.
class ReadingMessagesList extends StatefulWidget {
  const ReadingMessagesList({required this.messages, required this.hasNext, super.key});

  final List<Message> messages;
  final bool hasNext;

  @override
  State<ReadingMessagesList> createState() => _ReadingMessagesListState();
}

class _ReadingMessagesListState extends State<ReadingMessagesList> {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToLatest = false;

  static const Duration _scrollToLatestDuration = Duration(milliseconds: 280);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScrollOffsetChanged);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScrollOffsetChanged)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CommonPaginationListener(
          onListEnded: () {
            if (!widget.hasNext) return;
            context.read<ReadingViewBloc>().add(const ReadingViewEvent.onNextPageRequested());
          },
          listenableChild: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomScrollView(
              controller: _scrollController,
              reverse: true,
              slivers: <Widget>[
                if (widget.messages.isEmpty)
                  const SliverFillRemaining(hasScrollBody: false, child: EmptyMessagesPlaceholder())
                else ...<Widget>[
                  const SliverToBoxAdapter(child: SizedBox(height: 20)),
                  SliverList.separated(
                    itemCount: widget.messages.length,
                    itemBuilder: (_, int i) => MessageBubble(
                      message: widget.messages.elementAt(widget.messages.length - 1 - i),
                      clusterAttribute: _getClusterAttribute(widget.messages, i),
                    ),
                    separatorBuilder: (_, int i) => _isInsideDay(widget.messages, i)
                        ? VerticalMessageSpacer(messages: widget.messages, builderIndex: i)
                        : BetweenDaysDivider(
                            message: widget.messages.elementAt(widget.messages.length - 1 - i),
                          ),
                  ),
                  SliverToBoxAdapter(child: BetweenDaysDivider(message: widget.messages.first)),
                ],
              ],
            ),
          ),
        ),
        Positioned(
          right: Values.horizontalPadding,
          bottom: 12,
          child: IgnorePointer(
            ignoring: !_showScrollToLatest,
            child: AnimatedOpacity(
              opacity: _showScrollToLatest ? 1 : 0,
              duration: const Duration(milliseconds: 180),
              child: AnimatedScale(
                scale: _showScrollToLatest ? 1 : 0.85,
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOutCubic,
                child: ScrollToLatestButton(onPressed: _scrollToLatest),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onScrollOffsetChanged() {
    if (!_scrollController.hasClients) return;

    final double viewportHeight = _scrollController.position.viewportDimension;
    final bool shouldShow = _scrollController.offset > viewportHeight;
    if (shouldShow == _showScrollToLatest) return;

    setState(() => _showScrollToLatest = shouldShow);
  }

  Future<void> _scrollToLatest() async {
    if (!_scrollController.hasClients) return;

    await _scrollController.animateTo(
      0,
      duration: _scrollToLatestDuration,
      curve: Curves.easeOutCubic,
    );
  }

  ClusterAttribute? _getClusterAttribute(List<Message> messages, int builderIndex) {
    final int i = messages.length - 1 - builderIndex;

    final Message current = messages[i];
    final Message? prev = i > 0 ? messages[i - 1] : null;
    final Message? next = i < messages.length - 1 ? messages[i + 1] : null;

    final bool hasPrevSameAuthor =
        prev != null && prev.fromId == current.fromId && _isSameDay(current, prev);
    final bool hasNextSameAuthor =
        next != null && next.fromId == current.fromId && _isSameDay(current, next);

    if (!hasPrevSameAuthor && !hasNextSameAuthor) return null;
    if (!hasPrevSameAuthor) return ClusterAttribute.first;
    if (!hasNextSameAuthor) return ClusterAttribute.last;
    return ClusterAttribute.middle;
  }

  bool _isInsideDay(List<Message> messages, int builderIndex) {
    final int i = messages.length - 1 - builderIndex;
    return _isSameDay(messages[i], messages[i - 1]);
  }

  bool _isSameDay(Message a, Message b) {
    final DateTime aLocal = a.createdAt.toLocal();
    final DateTime bLocal = b.createdAt.toLocal();
    return aLocal.year == bLocal.year && aLocal.month == bLocal.month && aLocal.day == bLocal.day;
  }
}
