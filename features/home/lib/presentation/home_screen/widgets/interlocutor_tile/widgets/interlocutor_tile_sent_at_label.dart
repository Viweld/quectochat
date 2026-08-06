import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

/// Relative / absolute timestamp on the trailing side of a contact tile.
class InterlocutorTileSentAtLabel extends StatelessWidget {
  const InterlocutorTileSentAtLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(label, style: context.caption);
  }
}
