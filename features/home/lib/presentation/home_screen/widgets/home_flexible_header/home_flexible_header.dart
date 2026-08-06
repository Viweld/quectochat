import 'package:flutter/material.dart';
import 'package:home/presentation/home_screen/widgets/home_flexible_header/widgets/home_flexible_header_menu_button.dart';
import 'package:home/presentation/home_screen/widgets/home_flexible_header/widgets/home_flexible_header_search_field.dart';
import 'package:shared_ui/core_ui.dart';

/// Collapsing home header: search field and menu in one row.
class HomeFlexibleHeader extends StatelessWidget {
  const HomeFlexibleHeader({
    super.key,
    required this.onSearchTextChanged,
    required this.onSearchFieldClearTapped,
    required this.onMenuTapped,
  });

  final ValueChanged<String> onSearchTextChanged;
  final VoidCallback onSearchFieldClearTapped;
  final VoidCallback onMenuTapped;

  static const double topPadding = 14;
  static const double bottomPadding = 24;
  static const double searchMenuGap = 12;

  /// Height for [SliverAppBar.expandedHeight] under an outer [SafeArea].
  static double get expandedHeight => topPadding + bottomPadding + Values.textFieldHeight;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: ColoredBox(
        color: context.colors.background.main,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(
              top: topPadding,
              left: Values.horizontalPadding,
              right: Values.horizontalPadding,
              bottom: bottomPadding,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: HomeFlexibleHeaderSearchField(
                    onChanged: onSearchTextChanged,
                    onClearTapped: onSearchFieldClearTapped,
                  ),
                ),
                const SizedBox(width: searchMenuGap),
                HomeFlexibleHeaderMenuButton(onTapped: onMenuTapped),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
