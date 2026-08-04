import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

class ImageViewerPageIndicators extends StatelessWidget {
  const ImageViewerPageIndicators({required this.count, required this.activeIndex, super.key});

  final int count;
  final int activeIndex;

  static const double _inactiveDotSize = 6;
  static const double _activeDotScale = 1.5;
  static const double _dotSpacing = 8;

  @override
  Widget build(BuildContext context) {
    if (count <= 1) {
      return const SizedBox.shrink();
    }

    final Color inactiveColor = context.colors.text.inverse.withValues(alpha: 0.45);
    final Color activeColor = context.colors.accent.main;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(count, (int index) {
        final bool isActive = index == activeIndex;
        final double dotSize = isActive ? _inactiveDotSize * _activeDotScale : _inactiveDotSize;

        return Padding(
          padding: index == 0 ? EdgeInsets.zero : const EdgeInsets.only(left: _dotSpacing),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: dotSize,
            height: dotSize,
            decoration: BoxDecoration(
              color: isActive ? activeColor : inactiveColor,
              shape: BoxShape.circle,
            ),
          ),
        );
      }),
    );
  }
}
