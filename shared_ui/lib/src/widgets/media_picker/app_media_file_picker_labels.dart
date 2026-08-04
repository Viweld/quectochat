import 'package:flutter/foundation.dart';

/// User-facing copy for the media file picker. Localized in the feature layer.
@immutable
final class AppMediaFilePickerLabels {
  const AppMediaFilePickerLabels({
    required this.accessDeniedNote,
    required this.openAppSettings,
    required this.emptyAlbumsNote,
    required this.allowCameraInSettingsNote,
    required this.cameraCaptureHint,
    required this.done,
    required this.selectedCountPrefix,
    required this.back,
    required this.ok,
  });

  final String accessDeniedNote;
  final String openAppSettings;
  final String emptyAlbumsNote;
  final String allowCameraInSettingsNote;
  final String cameraCaptureHint;
  final String done;
  final String selectedCountPrefix;
  final String back;
  final String ok;
}
