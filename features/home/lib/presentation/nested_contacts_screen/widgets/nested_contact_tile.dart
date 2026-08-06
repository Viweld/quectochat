import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

class NestedContactTile extends StatelessWidget {
  const NestedContactTile({super.key, required this.displayName, required this.onTapped});

  final String displayName;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: Values.horizontalPadding),
        child: Row(
          children: <Widget>[
            CommonUserAvatar(displayName: displayName),
            const SizedBox(width: 12),
            Expanded(
              child: Text(displayName, style: context.username, overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
    );
  }
}
