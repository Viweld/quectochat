import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

/// Search field in the home flexible header row.
class HomeFlexibleHeaderSearchField extends StatelessWidget {
  const HomeFlexibleHeaderSearchField({
    super.key,
    required this.onChanged,
    required this.onClearTapped,
  });

  final ValueChanged<String> onChanged;
  final VoidCallback onClearTapped;

  @override
  Widget build(BuildContext context) {
    return AppEditField(
      onChanged: onChanged,
      onClearTapped: onClearTapped,
      prefix: AppIcons.userSearch(color: context.colors.icon.secondary),
      hintText: context.texts.homeSearchHint,
    );
  }
}
