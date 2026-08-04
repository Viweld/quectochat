part of '../app_media_file_picker.dart';

class _MediaTile extends StatelessWidget {
  const _MediaTile({
    required this.onItemSelected,
    required this.previews,
    required this.entities,
    required this.selectedEntities,
    required this.mode,
    required this.index,
  });

  final void Function(AssetEntity) onItemSelected;
  final List<Widget> previews;
  final List<AssetEntity> entities;
  final List<AssetEntity> selectedEntities;
  final _MediaPickerMode mode;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Stack(
        children: <Widget>[
          Positioned.fill(child: ColoredBox(color: context.colors.background.main)),
          previews.elementAt(index),
          if (mode == _MediaPickerMode.multipleMedia)
            Positioned(
              top: 10,
              right: 10,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colors.background.main,
                ),
                child: _MediaPickerCheckbox(
                  isChecked: selectedEntities.contains(entities.elementAt(index)),
                ),
              ),
            ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onItemSelected(entities.elementAt(index)),
              overlayColor: WidgetStateProperty.all(
                context.colors.accent.main.withValues(alpha: 0.12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
