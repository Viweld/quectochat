part of '../app_media_file_picker.dart';

class _CameraCaptureScreen extends StatefulWidget {
  const _CameraCaptureScreen({
    required this.cameraController,
    required this.mode,
    required this.labels,
  });

  final CameraCaptureController cameraController;
  final _MediaPickerMode mode;
  final AppMediaFilePickerLabels labels;

  @override
  State<_CameraCaptureScreen> createState() => _CameraCaptureScreenState();
}

class _CameraCaptureScreenState extends State<_CameraCaptureScreen> {
  final ValueNotifier<bool> _showTimer = ValueNotifier<bool>(false);
  bool _isRecording = false;
  bool _isTakingPicture = false;
  Duration _recordDuration = Duration.zero;
  Timer? _timer;

  CameraController get _controller => widget.cameraController.controller!;

  @override
  void dispose() {
    _timer?.cancel();
    _showTimer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          const Positioned.fill(child: ColoredBox(color: Colors.black)),
          Positioned.fill(
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: SizedBox(
                width: screenSize.width,
                height: screenSize.width * _controller.value.aspectRatio,
                child: CameraPreview(_controller),
              ),
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: _showTimer,
            builder: (BuildContext context, bool show, Widget? _) {
              if (!show) return const SizedBox();
              return Positioned(
                top: 50,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.24),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.fiber_manual_record,
                          size: 22,
                          color: context.colors.feedback.error,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _formatDuration(_recordDuration),
                          style: context.username?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => unawaited(_takePhoto()),
                    onLongPress: () => unawaited(_startVideoRecording()),
                    onLongPressUp: () => unawaited(_stopVideoRecording()),
                    child: FloatingActionButton.large(
                      heroTag: null,
                      shape: const CircleBorder(),
                      onPressed: null,
                      backgroundColor: _isRecording ? Colors.red : Colors.white,
                    ),
                  ),
                  if (widget.mode == _MediaPickerMode.multipleMedia) ...<Widget>[
                    const SizedBox(height: 12),
                    Text(
                      widget.labels.cameraCaptureHint,
                      textAlign: TextAlign.center,
                      style: context.caption?.copyWith(color: Colors.white),
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (widget.mode == _MediaPickerMode.singleImage)
            Positioned(
              bottom: 46,
              right: 30,
              child: IconButton(
                icon: const Icon(Icons.cameraswitch, color: Colors.white, size: 46),
                onPressed: () async {
                  await widget.cameraController.switchCamera();
                  if (context.mounted) setState(() {});
                },
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _takePhoto() async {
    if (_isTakingPicture || _isRecording) return;
    setState(() => _isTakingPicture = true);
    try {
      final XFile file = await _controller.takePicture();
      if (!mounted) return;
      unawaited(_openPreviewScreen(File(file.path), fileType: AppMediaFileType.image));
    } on Object {
      // Ignore capture failures; user can retry.
    } finally {
      if (mounted) setState(() => _isTakingPicture = false);
    }
  }

  Future<void> _startVideoRecording() async {
    if (widget.mode == _MediaPickerMode.singleImage) return;
    if (_isRecording || _isTakingPicture) return;
    try {
      await _controller.startVideoRecording();
      _recordDuration = Duration.zero;
      _showTimer.value = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        setState(() {
          _recordDuration += const Duration(seconds: 1);
        });
      });
      setState(() => _isRecording = true);
    } on Object {
      // Ignore start failures.
    }
  }

  Future<void> _stopVideoRecording() async {
    if (widget.mode == _MediaPickerMode.singleImage) return;
    if (!_isRecording) return;
    _timer?.cancel();
    _showTimer.value = false;
    setState(() => _isRecording = false);
    try {
      final XFile file = await _controller.stopVideoRecording();
      if (!mounted) return;
      unawaited(_openPreviewScreen(File(file.path), fileType: AppMediaFileType.video));
    } on Object {
      // Ignore stop failures.
    }
  }

  Future<void> _openPreviewScreen(File file, {required AppMediaFileType fileType}) async {
    final AppMediaFile? result = await Navigator.of(context).push<AppMediaFile?>(
      MaterialPageRoute<AppMediaFile?>(
        builder: (BuildContext _) => _MediaPreviewScreen(
          file: file,
          fileType: fileType,
          duration: switch (fileType) {
            AppMediaFileType.image => null,
            AppMediaFileType.video => _recordDuration,
          },
          labels: widget.labels,
        ),
      ),
    );
    if (result == null || !mounted) return;
    Navigator.pop(context, result);
  }

  String _formatDuration(Duration duration) {
    final String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}

class _MediaPreviewScreen extends StatelessWidget {
  const _MediaPreviewScreen({
    required this.file,
    required this.fileType,
    required this.duration,
    required this.labels,
  });

  final File file;
  final AppMediaFileType fileType;
  final Duration? duration;
  final AppMediaFilePickerLabels labels;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Center(
            child: switch (fileType) {
              AppMediaFileType.video => _VideoPlayerWidget(file: file),
              AppMediaFileType.image => InteractiveViewer(child: Image.file(file)),
            },
          ),
          Positioned(
            bottom: 40,
            left: 40,
            right: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(onPressed: () => Navigator.pop(context), child: Text(labels.back)),
                ElevatedButton(
                  onPressed: () => unawaited(_onOkTapped(context)),
                  child: Text(labels.ok),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onOkTapped(BuildContext context) async {
    final AppMediaFile mediaFile = await _createAppMediaFile(file: file, fileType: fileType);
    if (!context.mounted) return;
    Navigator.pop(context, mediaFile);
  }

  Future<AppMediaFile> _createAppMediaFile({
    required File file,
    required AppMediaFileType fileType,
  }) async {
    final String name = file.path.split(Platform.pathSeparator).last;
    final int sizeInBytes = await file.length();
    final String fileSize = _formatBytes(sizeInBytes);
    Uint8List? cover;

    if (fileType == AppMediaFileType.image) {
      cover = await file.readAsBytes();
    } else if (fileType == AppMediaFileType.video) {
      cover = await _getVideoThumbnail(file.path);
    }

    return AppMediaFile(
      fileType: fileType,
      cover: cover,
      name: name,
      fileSize: fileSize,
      file: file,
      duration: duration,
    );
  }

  String _formatBytes(int bytes, [int decimals = 2]) {
    if (bytes == 0) return '0 B';
    const List<String> suffixes = <String>['B', 'KB', 'MB', 'GB'];
    final int i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  Future<Uint8List?> _getVideoThumbnail(String videoPath) {
    return VideoThumbnail.thumbnailData(video: videoPath, maxWidth: 128, quality: 75);
  }
}

class _VideoPlayerWidget extends StatefulWidget {
  const _VideoPlayerWidget({required this.file});

  final File file;

  @override
  State<_VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<_VideoPlayerWidget> {
  late final VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.file)
      ..initialize().then((_) {
        if (mounted) setState(() {});
      });
  }

  @override
  void dispose() {
    unawaited(_controller.dispose());
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        unawaited(_controller.play());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlayPause,
      child: _controller.value.isInitialized
          ? AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller))
          : CircularProgressIndicator(color: context.colors.accent.main),
    );
  }
}
