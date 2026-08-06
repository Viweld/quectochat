import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

/// Settings / drawer affordance in the home flexible header.
class HomeFlexibleHeaderMenuButton extends StatelessWidget {
  const HomeFlexibleHeaderMenuButton({super.key, required this.onTapped});

  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: context.texts.homeDrawerMenuLabel,
      child: SizedBox.square(
        dimension: Values.textFieldHeight,
        child: AppIcons.menu(color: context.colors.icon.main, onTap: onTapped),
      ),
    );
  }
}
