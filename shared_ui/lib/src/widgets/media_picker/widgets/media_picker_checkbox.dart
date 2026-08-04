part of '../app_media_file_picker.dart';

class _MediaPickerCheckbox extends StatelessWidget {
  const _MediaPickerCheckbox({required this.isChecked});

  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    final Color accent = context.colors.accent.main;
    final Color border = context.colors.border.main;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 120),
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isChecked ? accent : context.colors.background.main,
        border: Border.all(color: isChecked ? accent : border),
      ),
      child: isChecked ? Icon(Icons.check, size: 14, color: context.colors.text.inverse) : null,
    );
  }
}
