part of '../app_media_file_picker.dart';

const String _cameraHeroTag = 'camera-tile-hero';

class _CameraTile extends StatefulWidget {
  const _CameraTile({required this.cameraController, required this.isGranted, required this.mode});

  final _MediaPickerMode mode;
  final bool? isGranted;
  final CameraCaptureController cameraController;

  @override
  State<_CameraTile> createState() => _CameraTileState();
}

class _CameraTileState extends State<_CameraTile> {
  @override
  Widget build(BuildContext context) {
    if (widget.isGranted == null) {
      return const SizedBox();
    }

    final AppMediaFilePickerLabels labels = _AppMediaFilePickerScope.of(context);
    final Color splash = context.colors.splash.main;

    return Hero(
      tag: _cameraHeroTag,
      child: Padding(
        padding: const EdgeInsets.all(0.5),
        child: !widget.isGranted!
            ? Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned.fill(child: ColoredBox(color: context.colors.background.secondary)),
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        labels.allowCameraInSettingsNote,
                        textAlign: TextAlign.center,
                        style: context.caption.copyWith(color: context.colors.text.secondary),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => unawaited(PhotoManager.openSetting()),
                      overlayColor: WidgetStateProperty.all(splash),
                    ),
                  ),
                ],
              )
            : Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  if (widget.cameraController.isInitialized &&
                      widget.cameraController.controller != null)
                    Positioned.fill(child: CameraPreview(widget.cameraController.controller!)),
                  Positioned.fill(
                    child: ColoredBox(color: context.colors.text.secondary.withValues(alpha: 0.2)),
                  ),
                  Positioned(
                    right: 12,
                    top: 12,
                    child: Icon(
                      Icons.photo_camera_outlined,
                      size: 40,
                      color: context.colors.text.inverse,
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => unawaited(_onCameraTapped(context)),
                      overlayColor: WidgetStateProperty.all(splash),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Future<void> _onCameraTapped(BuildContext context) async {
    final AppMediaFile? file = await Navigator.of(context).push<AppMediaFile?>(
      MaterialPageRoute<AppMediaFile?>(
        builder: (BuildContext _) => _CameraCaptureScreen(
          cameraController: widget.cameraController,
          mode: widget.mode,
          labels: _AppMediaFilePickerScope.of(context),
        ),
      ),
    );
    if (!context.mounted || file == null) return;
    switch (widget.mode) {
      case _MediaPickerMode.singleImage:
        Navigator.pop(context, file);
      case _MediaPickerMode.multipleMedia:
        Navigator.pop(context, <AppMediaFile>[file]);
    }
  }
}
