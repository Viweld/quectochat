import 'package:flutter/material.dart';
import 'package:home/presentation/home_screen/widgets/interlocutor_list_tile_frame.dart';
import 'package:shared_domain/shared_domain.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
    required this.interlocutor,
    required this.onTapped,
    this.showBottomShadow = false,
  });

  final Interlocutor interlocutor;
  final VoidCallback onTapped;
  final bool showBottomShadow;

  @override
  Widget build(BuildContext context) {
    return InterlocutorTileInk(interlocutor: interlocutor, onTap: onTapped
    );
  }
}
