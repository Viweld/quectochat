import 'package:flutter/material.dart';
import 'package:shared_ui/src/extensions/context_extensions.dart';

class CommonPendingIndicator extends StatelessWidget {
  const CommonPendingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 120,
      child: CircularProgressIndicator(strokeWidth: 8, color: context.colors.accent.main),
    );
  }
}
