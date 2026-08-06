import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

class FlexibleHeader extends StatelessWidget {
  const FlexibleHeader({
    super.key,
    required this.onSearchTextChanged,
    required this.onSearchFieldClearTapped,
    required this.onMenuTapped,
  });

  static const double toTitlePadding = 14;
  static const double toFieldPadding = 4;
  static const double toDividerPadding = 24;

  final void Function(String) onSearchTextChanged;
  final void Function() onSearchFieldClearTapped;
  final void Function() onMenuTapped;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.paddingOf(context).top;
    final double titleHeight = context.mainTitle?.height ?? 0;
    final double titleSize = context.mainTitle?.fontSize ?? 0;

    return FlexibleSpaceBar(
      background: ColoredBox(
        color: context.colors.background.main,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: statusBarHeight + toTitlePadding,
                  left: Values.horizontalPadding,
                  right: Values.horizontalPadding,
                  bottom: toFieldPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(context.texts.homeTitle, style: context.mainTitle),
                    Semantics(
                      button: true,
                      label: context.texts.homeDrawerMenuLabel,
                      child: SizedBox.square(
                        dimension: titleHeight * titleSize,
                        child: AppIcons.setting(
                          color: context.colors.icon.main,
                          onTap: onMenuTapped,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: Values.horizontalPadding,
                right: Values.horizontalPadding,
                bottom: toDividerPadding,
              ),
              child: CommonEditField(
                onChanged: onSearchTextChanged,
                onClearTapped: onSearchFieldClearTapped,
                prefix: AppIcons.userSearch(color: context.colors.icon.secondary),
                hintText: context.texts.homeSearchHint,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
