import 'package:flutter/material.dart';
import 'package:home/presentation/home_screen/widgets/interlocutor_list_tile_frame.dart';
import 'package:shared_domain/shared_domain.dart';
import 'package:shared_ui/core_ui.dart';

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
    final AppColorsTheme colors = context.colors;

    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 50,
          bottom: 0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: colors.text.main.withValues(alpha: 0.22),
                  blurRadius: 10,
                  offset: const Offset(6, 0),
                ),
              ],
            ),
          ),
        ),
        InterlocutorTileInk(interlocutor: interlocutor, onTap: onTapped),
      ],
    );
  }
}
