import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

/// Soft falloff from the app bar onto the recessed under-plane of the first tile.
class PinnedTileHeaderContactShadow extends StatelessWidget {
  const PinnedTileHeaderContactShadow({super.key});

  static const double _height = 10;

  @override
  Widget build(BuildContext context) {
    final Color shadow = context.colors.shadow.main;

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
