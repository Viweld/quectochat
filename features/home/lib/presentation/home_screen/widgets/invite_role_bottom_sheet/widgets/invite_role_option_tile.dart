import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

/// Single selectable role row inside the invite-role bottom sheet.
class InviteRoleOptionTile extends StatelessWidget {
  const InviteRoleOptionTile({super.key, required this.title, required this.onTapped});

  final String title;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: context.username.copyWith(color: context.colors.text.main)),
      onTap: onTapped,
    );
  }
}
