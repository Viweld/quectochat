import 'package:flutter/material.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

/// Bottom sheet to pick invitation target role (parent / child / friend).
class InviteRoleBottomSheet extends StatelessWidget {
  const InviteRoleBottomSheet({super.key, required this.onRoleSelected});

  final ValueChanged<String> onRoleSelected;

  static Future<void> show(BuildContext context, {required ValueChanged<String> onRoleSelected}) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext sheetContext) => InviteRoleBottomSheet(onRoleSelected: onRoleSelected),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations texts = context.texts;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          Values.horizontalPadding,
          16,
          Values.horizontalPadding,
          24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(texts.inviteRoleSheetTitle, style: context.username, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            _InviteRoleOption(
              title: texts.inviteRoleParent,
              onTapped: () {
                Navigator.of(context).pop();
                onRoleSelected('parent');
              },
            ),
            _InviteRoleOption(
              title: texts.inviteRoleChild,
              onTapped: () {
                Navigator.of(context).pop();
                onRoleSelected('child');
              },
            ),
            _InviteRoleOption(
              title: texts.inviteRoleFriend,
              onTapped: () {
                Navigator.of(context).pop();
                onRoleSelected('friend');
              },
            ),
          ],
        ),
      ),
    );
  }
}

final class _InviteRoleOption extends StatelessWidget {
  const _InviteRoleOption({required this.title, required this.onTapped});

  final String title;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(title), onTap: onTapped);
  }
}
