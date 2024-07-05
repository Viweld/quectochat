import 'package:flutter/material.dart';

class CommonPendingIndicator extends StatelessWidget {
  const CommonPendingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.square(
      dimension: 120,
      child: CircularProgressIndicator(
        strokeWidth: 8,
      ),
    );
  }
}
