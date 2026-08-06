import 'package:flutter/material.dart';
import 'package:home/presentation/home_screen/widgets/pinned_interlocutor_tile/widgets/nested_unread_count_badge.dart';
import 'package:shared_ui/core_ui.dart';

/// Nested-contacts chevron (and optional unread badge) revealed under a pinned tile.
class PinnedTileRevealActions extends StatelessWidget {
  const PinnedTileRevealActions({
    super.key,
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
            NestedUnreadCountBadge(count: nestedUnreadCount),
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
