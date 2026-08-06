import 'package:flutter/material.dart';
import 'package:home/presentation/home_screen/widgets/chat_tile/widgets/chat_tile_cast_shadow.dart';
import 'package:home/presentation/home_screen/widgets/interlocutor_tile/interlocutor_tile_body.dart';
import 'package:shared_domain/shared_domain.dart';

/// Regular (non-pinned) interlocutor row on the home chats list.
class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
    required this.interlocutor,
    required this.onTapped,
    this.showTopBorder = true,
  });

  final Interlocutor interlocutor;
  final VoidCallback onTapped;

  /// When `false`, omits the top edge so the row can sit flush under an app-bar divider.
  final bool showTopBorder;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const ChatTileCastShadow(),
        InterlocutorTileBody(
          interlocutor: interlocutor,
          onTap: onTapped,
          showTopBorder: showTopBorder,
        ),
      ],
    );
  }
}
