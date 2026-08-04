part of '../../app_media_file_picker.dart';

class CameraCaptureController {
  CameraController? _controller;
  CameraDescription? _backCamera;
  CameraDescription? _frontCamera;
  bool _isBackCamera = true;

  bool get isInitialized => _controller?.value.isInitialized == true;

  bool get isBackCamera => _isBackCamera;

  CameraController? get controller => _controller;

  Future<void> initialize() async {
    final List<CameraDescription> cameras = await availableCameras();
    if (cameras.isEmpty) return;

    _backCamera = cameras.where((CameraDescription c) {
      return c.lensDirection == CameraLensDirection.back;
    }).firstOrNull;
    _frontCamera = cameras.where((CameraDescription c) {
      return c.lensDirection == CameraLensDirection.front;
    }).firstOrNull;

    final CameraDescription initial = _backCamera ?? _frontCamera ?? cameras.first;
    _isBackCamera = identical(initial, _backCamera) || _frontCamera == null;

    _controller = CameraController(initial, ResolutionPreset.high);
    await _controller?.initialize();
    await _controller?.setFocusMode(FocusMode.auto);
    await _controller?.setExposureMode(ExposureMode.auto);
    await _controller?.unlockCaptureOrientation();
  }

  Future<void> switchCamera() async {
    if (_controller == null || _backCamera == null || _frontCamera == null) {
      return;
    }

    final CameraDescription newCamera = _isBackCamera ? _frontCamera! : _backCamera!;
    _isBackCamera = !_isBackCamera;

    await _controller?.dispose();
    _controller = CameraController(newCamera, ResolutionPreset.high);
    await _controller?.initialize();
    await _controller?.setFocusMode(FocusMode.auto);
    await _controller?.setExposureMode(ExposureMode.auto);
    await _controller?.unlockCaptureOrientation();
  }

  Future<void> dispose() async {
    await _controller?.dispose();
    _controller = null;
    _backCamera = null;
    _frontCamera = null;
  }
}
