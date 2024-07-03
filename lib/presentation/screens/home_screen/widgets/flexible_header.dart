part of '../home_screen.dart';

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
/// СВОРАЧИВАЮЩАЯСЯ ШАПКА ЭКРАНА
class _FlexibleHeader extends StatelessWidget {
  const _FlexibleHeader({
    required this.onSearchTextChanged,
    required this.onSearchFieldClearTapped,
    required this.onMenuTapped,
  });

  final void Function(String) onSearchTextChanged;
  final void Function() onSearchFieldClearTapped;
  final void Function() onMenuTapped;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Кнопка "История"
              Text(
                'Чаты',
                style: context.style32w600$mainTitle,
              ),

              /// Контролл открытия меню
              const Icon(Icons.more_vert_rounded),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: CommonEditField(),
          ),
        ],
      ),
    );
  }
}
