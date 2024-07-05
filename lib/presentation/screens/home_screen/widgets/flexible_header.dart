part of '../home_screen.dart';

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
/// СВОРАЧИВАЮЩАЯСЯ ШАПКА ЭКРАНА
class _FlexibleHeader extends StatelessWidget {
  const _FlexibleHeader({
    required this.onSearchTextChanged,
    required this.onSearchFieldClearTapped,
    required this.onExitTapped,
  });

  static const double toTitlePadding = 14;
  static const double toFieldPadding = 4;
  static const double toDividerPadding = 24;

  final void Function(String) onSearchTextChanged;
  final void Function() onSearchFieldClearTapped;
  final void Function() onExitTapped;

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.paddingOf(context).top;
    final titleHeight = context.style32w600$mainTitle?.height ?? 0;
    final titleSize = context.style32w600$mainTitle?.fontSize ?? 0;

    return FlexibleSpaceBar(
      background: ColoredBox(
        color: context.palette.white,
        child: Column(
          children: [
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
                  children: [
                    /// Кнопка "История"
                    Text(
                      'Чаты',
                      style: context.style32w600$mainTitle,
                    ),

                    /// Выпадающее меню с дополнительными функциями
                    SizedBox.square(
                      dimension: titleHeight * titleSize,
                      child: PopupMenuButton(
                        icon: const Icon(Icons.more_vert_rounded),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            onTap: onExitTapped,
                            child: const Row(
                              children: [
                                Icon(Icons.logout_rounded),
                                Text('Выйти'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Поле ввода поискового запроса
            Padding(
              padding: const EdgeInsets.only(
                left: Values.horizontalPadding,
                right: Values.horizontalPadding,
                bottom: toDividerPadding,
              ),
              child: CommonEditField(
                onChanged: onSearchTextChanged,
                onClearTapped: onSearchFieldClearTapped,
                prefix: Icon(
                  Qicons.search,
                  color: context.palette.gray,
                ),
                hintText: 'Поиск',
              ),
            ),

            Divider(
              height: Values.dividerThickness,
              color: context.palette.gray,
            ),
          ],
        ),
      ),
    );
  }
}
