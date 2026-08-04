part of '../app_media_file_picker.dart';

@immutable
class AppMediaFile {
  const AppMediaFile({
    required this.fileType,
    required this.cover,
    required this.name,
    required this.fileSize,
    required this.file,
    required this.duration,
  });

  final AppMediaFileType fileType;
  final Uint8List? cover;
  final String? name;
  final String? fileSize;
  final File? file;
  final Duration? duration;

  AppMediaFile copyWithoutCover() => AppMediaFile(
    fileType: fileType,
    cover: null,
    name: name,
    fileSize: fileSize,
    file: file,
    duration: duration,
  );
}
