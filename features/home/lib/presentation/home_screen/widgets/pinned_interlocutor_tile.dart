import 'package:flutter/material.dart';
import 'package:home/presentation/home_screen/widgets/interlocutor_list_tile_frame.dart';
import 'package:shared_domain/shared_domain.dart';
import 'package:shared_ui/core_ui.dart';

/// Pinned tile: slides left to reveal nested-contacts actions on a recessed plane.
///
/// Shadows:
/// * The sliding body casts only to its trailing (right) edge — painted under the
///   opaque tile and clipped to this slot, so it lands on the under-plane.
/// * When [receivesHeaderShadow] is true, the under-plane shows a top falloff from
///   the app bar (header paint cannot reach through an opaque under-plane).
class PinnedInterlocutorTile extends StatefulWidget {
  const PinnedInterlocutorTile({
    super.key,
    required this.interlocutor,
    required this.onChatTapped,
    required this.onRevealNestedTapped,
    this.receivesHeaderShadow = false,
  });

  final Interlocutor interlocutor;
  final VoidCallback onChatTapped;
  final VoidCallback onRevealNestedTapped;

  /// First list row: under-plane receives the app-bar contact shadow.
  final bool receivesHeaderShadow;

  @override
  State<PinnedInterlocutorTile> createState() => _PinnedInterlocutorTileState();
}

class _PinnedInterlocutorTileState extends State<PinnedInterlocutorTile>
    with SingleTickerProviderStateMixin {
  static const double _revealWidth = 76;

  late final AnimationController _controller;

  bool get _hasNestedUnread => widget.interlocutor.nestedUnreadContactCount > 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
      value: _hasNestedUnread ? 1 : 0,
    );
  }

  @override
  void didUpdateWidget(covariant PinnedInterlocutorTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.interlocutor.nestedUnreadContactCount == 0 && _hasNestedUnread) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        final double reveal = _controller.value;

        return Stack(
          children: <Widget>[
            if (widget.receivesHeaderShadow)
              const Positioned(top: 0, left: 0, right: 0, child: _HeaderContactShadow()),
            Positioned.fill(
              child: _RevealActions(
                hasNestedUnread: _hasNestedUnread,
                nestedUnreadCount: widget.interlocutor.nestedUnreadContactCount,
                onRevealNestedTapped: widget.onRevealNestedTapped,
              ),
            ),
            Transform.translate(
              offset: Offset(-_revealWidth * reveal, 0),
              child: DecoratedBox(
                // Only cast toward the revealed under-plane (no vertical offsets —
                // those read as muddy stripes where the tile has already left).
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: colors.text.main.withValues(alpha: 0.22),
                      blurRadius: 10,
                      offset: const Offset(6, 0),
                    ),
                  ],
                ),
                child: child,
              ),
            ),
          ],
        );
      },
      child: GestureDetector(
        onHorizontalDragUpdate: (DragUpdateDetails details) {
          _controller.value = (_controller.value - details.delta.dx / _revealWidth).clamp(0.0, 1.0);
        },
        onHorizontalDragEnd: (_) {
          if (_controller.value >= 0.35 || _hasNestedUnread) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        },
        child: InterlocutorTileInk(
          interlocutor: widget.interlocutor,
          onTap: () {
            widget.onChatTapped();
            if (!_hasNestedUnread) _controller.reverse();
          },
        ),
      ),
    );
  }
}

/// Soft falloff from the app bar onto the recessed under-plane.
class _HeaderContactShadow extends StatelessWidget {
  const _HeaderContactShadow();

  static const double _height = 10;

  @override
  Widget build(BuildContext context) {
    final Color shadow = context.colors.text.main;

    return IgnorePointer(
      child: SizedBox(
        height: _height,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[shadow.withValues(alpha: 0.18), shadow.withValues(alpha: 0)],
            ),
          ),
        ),
      ),
    );
  }
}

class _RevealActions extends StatelessWidget {
  const _RevealActions({
    required this.hasNestedUnread,
    required this.nestedUnreadCount,
    required this.onRevealNestedTapped,
  });

  final bool hasNestedUnread;
  final int nestedUnreadCount;
  final VoidCallback onRevealNestedTapped;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (hasNestedUnread) ...<Widget>[
            _UnreadContactsBadge(count: nestedUnreadCount),
            const SizedBox(width: 8),
          ],
          IconButton(
            tooltip: context.texts.pinnedRevealLabel,
            onPressed: onRevealNestedTapped,
            icon: AppIcons.chevronRight(color: context.colors.text.main),
          ),
        ],
      ),
    );
  }
}

class _UnreadContactsBadge extends StatelessWidget {
  const _UnreadContactsBadge({required this.count});

  final int count;

  static const double _size = 28;
  static const int _cap = 9;

  @override
  Widget build(BuildContext context) {
    final String label = count > _cap ? '9+' : '$count';

    return SizedBox.square(
      dimension: _size,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          AppIcons.messageFilled(color: context.colors.accent.main, size: _size),
          Text(
            label,
            style: context.caption?.copyWith(
              color: context.colors.text.inverse,
              fontSize: count > _cap ? 9 : 11,
              fontWeight: FontWeight.w700,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
