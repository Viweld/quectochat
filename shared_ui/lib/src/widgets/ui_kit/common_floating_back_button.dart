import 'package:flutter/material.dart';
import 'package:shared_ui/src/extensions/context_extensions.dart';
import 'package:shared_ui/src/values/values.dart';
import 'package:shared_ui/src/widgets/ui_kit/common_back_button.dart';

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
              colors: <Color>[
                context.colors.background.main,
                context.colors.background.main,
                context.colors.background.main.withValues(alpha: 0),
              ],
            ),
          ),
          child: Center(child: CommonBackButton(onPressed: onPressed)),
        ),
      ),
    );
  }
}
