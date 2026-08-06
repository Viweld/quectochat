import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home/presentation/home_screen/widgets/interlocutor_tile/interlocutor_tile_body.dart';
import 'package:home/presentation/home_screen/widgets/pinned_interlocutor_tile/widgets/pinned_tile_family_member_icon.dart';
import 'package:home/presentation/home_screen/widgets/pinned_interlocutor_tile/widgets/pinned_tile_header_contact_shadow.dart';
import 'package:home/presentation/home_screen/widgets/pinned_interlocutor_tile/widgets/pinned_tile_reveal_actions.dart';
import 'package:shared_domain/shared_domain.dart';
import 'package:shared_ui/core_ui.dart';

/// Pinned relative/inviter tile that slides left to reveal nested-contacts actions.
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

  /// Opens nested contacts; completes when that route is popped.
  final Future<void> Function() onRevealNestedTapped;

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
    final Color shadowColor = context.colors.shadow.main;

    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        final double reveal = _controller.value;

        return Stack(
          children: <Widget>[
            if (widget.receivesHeaderShadow)
              const Positioned(top: 0, left: 0, right: 0, child: PinnedTileHeaderContactShadow()),
            Positioned.fill(
              child: PinnedTileRevealActions(
                hasNestedUnread: _hasNestedUnread,
                nestedUnreadCount: widget.interlocutor.nestedUnreadContactCount,
                onRevealNestedTapped: () => unawaited(_openNestedContacts()),
              ),
            ),
            Transform.translate(
              offset: Offset(-_revealWidth * reveal, 0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: shadowColor.withValues(alpha: 0.22),
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
        child: Stack(
          children: <Widget>[
            InterlocutorTileBody(
              interlocutor: widget.interlocutor,
              onTap: () {
                widget.onChatTapped();
                if (!_hasNestedUnread) _controller.reverse();
              },
            ),
            const PinnedTileFamilyMemberIcon(),
          ],
        ),
      ),
    );
  }

  Future<void> _openNestedContacts() async {
    await widget.onRevealNestedTapped();
    if (!mounted || _hasNestedUnread) return;
    await _controller.reverse();
  }
}
