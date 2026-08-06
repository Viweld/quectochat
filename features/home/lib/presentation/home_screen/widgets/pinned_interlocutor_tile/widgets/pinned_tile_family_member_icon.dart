import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

/// Family-member mark in the bottom-trailing corner of a pinned relative tile.
class PinnedTileFamilyMemberIcon extends StatelessWidget {
  const PinnedTileFamilyMemberIcon({super.key});

  static const double _size = 16;
  static const double _trailingInset = 12;
  static const double _bottomInset = 8;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: _trailingInset,
      bottom: _bottomInset,
      child: AppIcons.familyMember(color: context.colors.text.secondary, size: _size),
    );
  }
}
