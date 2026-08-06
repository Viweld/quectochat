part of '../app_media_file_picker.dart';

class _BottomPickerButton extends StatelessWidget {
  const _BottomPickerButton({required this.onTapped, required this.selectedEntitiesCount});

  final VoidCallback onTapped;
  final int selectedEntitiesCount;

  @override
  Widget build(BuildContext context) {
    final AppMediaFilePickerLabels labels = _AppMediaFilePickerScope.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        border: BorderDirectional(top: BorderSide(color: context.colors.border.main)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (selectedEntitiesCount > 0)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  '${labels.selectedCountPrefix} $selectedEntitiesCount',
                  textAlign: TextAlign.center,
                  style: context.caption?.copyWith(color: context.colors.text.secondary),
                ),
              ),
            AppAccentButton(
              title: labels.done,
              onTapped: onTapped,
              isEnabled: selectedEntitiesCount > 0,
            ),
          ],
        ),
      ),
    );
  }
}
