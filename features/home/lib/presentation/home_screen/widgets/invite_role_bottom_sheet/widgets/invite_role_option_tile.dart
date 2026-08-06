import 'package:flutter/material.dart';

/// Single selectable role row inside the invite-role bottom sheet.
class InviteRoleOptionTile extends StatelessWidget {
  const InviteRoleOptionTile({super.key, required this.title, required this.onTapped});

  final String title;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(title), onTap: onTapped);
  }
}
