import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

/// Soft cast painted under the opaque chat tile body.
class ChatTileCastShadow extends StatelessWidget {
  const ChatTileCastShadow({super.key});

  static const double _topInset = 50;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: _topInset,
      bottom: 0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: context.colors.shadow.main.withValues(alpha: 0.22),
              blurRadius: 10,
              offset: const Offset(6, 0),
            ),
          ],
        ),
      ),
    );
  }
}
