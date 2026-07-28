import 'package:flutter/material.dart';
import '../../extensions/context_extensions.dart';
import '../../values/values.dart';
import 'common_back_button.dart';

class CommonFloatingBackButton extends StatelessWidget {
  const CommonFloatingBackButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-Values.horizontalPadding, 0),
      child: SizedBox.square(
        dimension: 80,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                context.palette.white,
                context.palette.white,
                context.palette.white.withValues(alpha: 0),
              ],
            ),
          ),
          child: Center(child: CommonBackButton(onPressed: onPressed)),
        ),
      ),
    );
  }
}
