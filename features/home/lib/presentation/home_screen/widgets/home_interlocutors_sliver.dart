import 'package:flutter/material.dart';
import 'package:home/domain/entities/current_user.dart';
import 'package:home/presentation/home_screen/widgets/chat_tile/chat_tile.dart';
import 'package:home/presentation/home_screen/widgets/pinned_interlocutor_tile/pinned_interlocutor_tile.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_domain/shared_domain.dart';

/// Virtualized home chats list as a [SliverList].
class HomeInterlocutorsSliver extends StatelessWidget {
  const HomeInterlocutorsSliver({
    super.key,
    required this.interlocutors,
    required this.currentUser,
    required this.navigator,
  });

  final List<Interlocutor> interlocutors;
  final CurrentUser? currentUser;
  final AppNavigator navigator;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: interlocutors.length, (
        BuildContext context,
        int index,
      ) {
        final Interlocutor item = interlocutors[index];

        void openChat() =>
            navigator.navigateChat(interlocutorId: item.userId, displayName: item.displayName);

        if (item.isPinned) {
          return PinnedInterlocutorTile(
            interlocutor: item,
            receivesHeaderShadow: index == 0,
            onChatTapped: openChat,
            onRevealNestedTapped: () => navigator.navigateNestedContacts(
              anchorUserId: item.userId,
              anchorDisplayName: item.displayName,
              isFriendsOfRelative: currentUser?.familyRole != null,
            ),
          );
        }

        return ChatTile(interlocutor: item, onTapped: openChat);
      }),
    );
  }
}
