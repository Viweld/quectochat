import 'package:flutter/material.dart';
import 'package:home/presentation/home_screen/widgets/invite_role_bottom_sheet/widgets/invite_role_option_tile.dart';
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
            Text(
              texts.inviteRoleSheetTitle,
              style: context.username.copyWith(color: context.colors.text.strong),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            InviteRoleOptionTile(
              title: texts.inviteRoleParent,
              onTapped: () => _select(context, 'parent'),
            ),
            InviteRoleOptionTile(
              title: texts.inviteRoleChild,
              onTapped: () => _select(context, 'child'),
            ),
            InviteRoleOptionTile(
              title: texts.inviteRoleFriend,
              onTapped: () => _select(context, 'friend'),
            ),
          ],
        ),
      ),
    );
  }

  void _select(BuildContext context, String role) {
    Navigator.of(context).pop();
    onRoleSelected(role);
  }
}
