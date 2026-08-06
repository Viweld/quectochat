import 'package:flutter/material.dart';
import 'package:home/presentation/home_screen/widgets/interlocutor_tile/interlocutor_tile_content.dart';
import 'package:shared_domain/shared_domain.dart';
import 'package:shared_ui/core_ui.dart';

/// Opaque tappable surface shared by regular and pinned interlocutor tiles.
class InterlocutorTileBody extends StatelessWidget {
  const InterlocutorTileBody({
    super.key,
    required this.interlocutor,
    required this.onTap,
    this.showTopBorder = true,
  });

  final Interlocutor interlocutor;
  final VoidCallback onTap;

  /// When `false`, omits the top edge so the row can sit flush under an app-bar divider.
  final bool showTopBorder;

  static const double contentVerticalPadding = 10;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final BorderSide borderSide = BorderSide(color: colors.border.main, width: 0.5);

    return ClipRect(
      child: Material(
        color: colors.background.main,
        child: InkWell(
          overlayColor: WidgetStateProperty.all(colors.accent.main),
          onTap: onTap,
          child: Ink(
            decoration: BoxDecoration(
              border: Border(
                top: showTopBorder ? borderSide : BorderSide.none,
                left: borderSide,
                right: borderSide,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: contentVerticalPadding,
                horizontal: Values.horizontalPadding,
              ),
              child: InterlocutorTileContent(interlocutor: interlocutor),
            ),
          ),
        ),
      ),
    );
  }
}
