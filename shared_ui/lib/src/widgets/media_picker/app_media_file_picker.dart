import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:shared_ui/src/extensions/context_extensions.dart';
import 'package:shared_ui/src/values/values.dart';
import 'package:shared_ui/src/widgets/media_picker/app_media_file_picker_labels.dart';
import 'package:shared_ui/src/widgets/ui_kit/common_accent_button.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

part 'models/app_media_file.dart';
part 'models/app_media_file_type.dart';
part 'widgets/controllers/camera_capture_controller.dart';
part 'widgets/camera_capture_screen.dart';
part 'widgets/camera_tile.dart';
part 'widgets/media_tile.dart';
part 'widgets/media_picker_checkbox.dart';
part 'widgets/top_panel.dart';
part 'widgets/bottom_panel.dart';

/// Gallery + camera picker bottom sheet.
class AppMediaFilePicker extends StatefulWidget {
  const AppMediaFilePicker._({required this.mode, required this.labels});

  final _MediaPickerMode mode;
  final AppMediaFilePickerLabels labels;

  static const int filesPageSize = 60;

  /// Picks a single image (gallery or camera photo).
  static Future<AppMediaFile?> singleImage(
    BuildContext context, {
    required AppMediaFilePickerLabels labels,
  }) {
    return _show<AppMediaFile?>(context, _MediaPickerMode.singleImage, labels);
  }

  /// Picks multiple images and/or videos.
  static Future<List<AppMediaFile>?> multipleMedia(
    BuildContext context, {
    required AppMediaFilePickerLabels labels,
  }) {
    return _show<List<AppMediaFile>?>(context, _MediaPickerMode.multipleMedia, labels);
  }

  static Future<T?> _show<T>(
    BuildContext context,
    _MediaPickerMode mode,
    AppMediaFilePickerLabels labels,
  ) {
    return showModalBottomSheet<T>(
      useRootNavigator: true,
      useSafeArea: true,
      isScrollControlled: true,
      constraints: const BoxConstraints(maxWidth: double.maxFinite),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) => AppMediaFilePicker._(mode: mode, labels: labels),
    );
  }

  @override
  State<AppMediaFilePicker> createState() => _AppMediaFilePickerState();
}

enum _MediaPickerMode { singleImage, multipleMedia }

final class _AppMediaFilePickerScope extends InheritedWidget {
  const _AppMediaFilePickerScope({required this.labels, required super.child});

  final AppMediaFilePickerLabels labels;

  static AppMediaFilePickerLabels of(BuildContext context) {
    final _AppMediaFilePickerScope? scope = context
        .dependOnInheritedWidgetOfExactType<_AppMediaFilePickerScope>();
    assert(scope != null, 'AppMediaFilePickerLabels scope is missing');
    return scope!.labels;
  }

  @override
  bool updateShouldNotify(_AppMediaFilePickerScope oldWidget) => labels != oldWidget.labels;
}

class _AppMediaFilePickerState extends State<AppMediaFilePicker> with WidgetsBindingObserver {
  final CameraCaptureController _cameraController = CameraCaptureController();
  final List<AssetEntity> _selectedEntities = <AssetEntity>[];
  bool _canRequestNextPage = true;

  bool? _isCameraGranted;
  bool? _isCataloguesGranted;

  bool _isEntitiesNotFound = false;
  final List<Widget> _previews = <Widget>[];
  final List<AssetEntity> _entities = <AssetEntity>[];
  int currentPage = 0;
  late int lastPage;

  final List<AssetPathEntity> _albums = <AssetPathEntity>[];
  AssetPathEntity? _selectedAlbum;

  /// When false, skip permission re-check on resume (native permission sheet).
  bool disableInactiveAppControl = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    unawaited(_initializeAfterPermissions());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_cameraController.dispose());
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed && !disableInactiveAppControl) {
      unawaited(() async {
        await Future<void>.delayed(const Duration(milliseconds: 300));
        await _initializeAfterPermissions();
      }());
    }
  }

  Future<void> _initializeAfterPermissions() async {
    disableInactiveAppControl = true;
    await _ensureAllPermissions();
    if (_isCameraGranted == true) {
      await _cameraController.initialize();
    }
    if (_isCataloguesGranted == true) {
      await _fetchNewMedia();
    }
    disableInactiveAppControl = false;
    if (mounted) setState(() {});
  }

  Future<void> _fetchNewMedia() async {
    final RequestType requestType = switch (widget.mode) {
      _MediaPickerMode.singleImage => RequestType.image,
      _MediaPickerMode.multipleMedia => RequestType.common,
    };

    final PermissionState permission = await PhotoManager.getPermissionState(
      requestOption: const PermissionRequestOption(),
    );

    if (permission == PermissionState.denied ||
        permission == PermissionState.notDetermined ||
        permission == PermissionState.restricted) {
      return;
    }

    if (permission == PermissionState.limited) {
      await PhotoManager.presentLimited(type: requestType);
      unawaited(_fetchGrantedMedia());
    } else if (permission == PermissionState.authorized) {
      unawaited(_fetchGrantedMedia());
    }
  }

  Future<void> _ensureAllPermissions() async {
    final PermissionState galleryPermission = await PhotoManager.requestPermissionExtend();
    final PermissionStatus cameraPermission = await Permission.camera.request();

    if (mounted) {
      setState(() {
        _isCataloguesGranted = galleryPermission.hasAccess;
        _isCameraGranted = cameraPermission.isGranted;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color sheetColor = context.colors.background.main;

    return _AppMediaFilePickerScope(
      labels: widget.labels,
      child: DraggableScrollableSheet(
        initialChildSize: 0.85,
        minChildSize: 0.3,
        maxChildSize: 0.85,
        builder: (BuildContext context, ScrollController controller) => DecoratedBox(
          decoration: BoxDecoration(
            color: sheetColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(26),
              topRight: Radius.circular(26),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _TopPickerPanel(
                mode: widget.mode,
                albums: _albums,
                selectedAlbum: _selectedAlbum,
                onAlbumSelected: _onAlbumSelected,
              ),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: _onNextPageRequested,
                  child: CustomScrollView(
                    controller: controller,
                    slivers: <Widget>[
                      SliverPadding(
                        padding: const EdgeInsets.only(top: 1),
                        sliver: SliverGrid(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          delegate: SliverChildBuilderDelegate(childCount: _previews.length + 1, (
                            BuildContext context,
                            int index,
                          ) {
                            if (index == 0) {
                              return _CameraTile(
                                isGranted: _isCameraGranted,
                                cameraController: _cameraController,
                                mode: widget.mode,
                              );
                            }
                            return _MediaTile(
                              onItemSelected: (AssetEntity item) =>
                                  unawaited(_onItemTapped(context, item)),
                              previews: _previews,
                              entities: _entities,
                              selectedEntities: _selectedEntities,
                              mode: widget.mode,
                              index: index - 1,
                            );
                          }),
                        ),
                      ),
                      if (_isEntitiesNotFound)
                        const SliverPadding(
                          padding: EdgeInsets.only(top: 76),
                          sliver: SliverToBoxAdapter(child: _EmptyCatalogue()),
                        ),
                      if (_isCataloguesGranted == false)
                        const SliverPadding(
                          padding: EdgeInsets.only(top: 76),
                          sliver: SliverToBoxAdapter(child: _PermissionDeniedContent()),
                        ),
                    ],
                  ),
                ),
              ),
              if (widget.mode == _MediaPickerMode.multipleMedia)
                _BottomPickerButton(
                  selectedEntitiesCount: _selectedEntities.length,
                  onTapped: () => unawaited(_onReadyTapped(context)),
                ),
              if (Platform.isIOS)
                SizedBox(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).viewPadding.bottom,
                  child: ColoredBox(color: sheetColor),
                ),
            ],
          ),
        ),
      ),
    );
  }

  bool _onNextPageRequested(ScrollNotification scroll) {
    if (scroll.metrics.maxScrollExtent <= 0) return false;
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentPage != lastPage) {
        unawaited(_fetchGrantedMedia());
      }
    }
    return false;
  }

  Future<void> _fetchGrantedMedia() async {
    if (!_canRequestNextPage) return;

    lastPage = currentPage;

    final RequestType requestType = switch (widget.mode) {
      _MediaPickerMode.singleImage => RequestType.image,
      _MediaPickerMode.multipleMedia => RequestType.common,
    };

    if (_albums.isEmpty) {
      final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        type: requestType,
        filterOption: FilterOptionGroup(orders: <OrderOption>[const OrderOption()]),
      );
      setState(() {
        _albums.addAll(albums);
        _selectedAlbum = _albums.firstOrNull;
      });
    }

    final AssetPathEntity? album = _selectedAlbum;
    if (album == null) return;

    final List<AssetEntity> pageEntities = await album.getAssetListPaged(
      page: currentPage,
      size: AppMediaFilePicker.filesPageSize,
    );

    // Defensive: drop videos if album was loaded without an image-only type filter.
    final List<AssetEntity> allEntities = switch (widget.mode) {
      _MediaPickerMode.singleImage =>
        pageEntities.where((AssetEntity e) => e.type == AssetType.image).toList(),
      _MediaPickerMode.multipleMedia => pageEntities,
    };

    if (allEntities.isEmpty) {
      setState(() => _isEntitiesNotFound = true);
      return;
    }

    final List<AssetEntity> visibleEntities = allEntities.take(12).toList();
    final List<AssetEntity> remainingEntities = allEntities.skip(12).toList();

    final List<Widget> initialPreviews = await _buildPreviewWidgets(visibleEntities);

    _entities.addAll(visibleEntities);
    _previews.addAll(initialPreviews);

    setState(() {
      currentPage++;
    });

    if (remainingEntities.isNotEmpty) {
      _entities.addAll(remainingEntities);
      unawaited(
        _buildPreviewWidgets(remainingEntities).then((List<Widget> restPreviews) {
          _previews.addAll(restPreviews);
          if (mounted) setState(() {});
        }),
      );
    }
  }

  Future<List<Widget>> _buildPreviewWidgets(List<AssetEntity> entities) async {
    final TextStyle? durationStyle = context.caption?.copyWith(color: Colors.white);
    final Map<AssetEntity, Uint8List?> thumbsDataMap = await _getThumbsDataMap(entities);
    final List<Widget> previews = <Widget>[];

    for (final AssetEntity entity in entities) {
      final Uint8List? thumbData = thumbsDataMap[entity];
      if (thumbData == null) continue;

      previews.add(
        Stack(
          children: <Widget>[
            Positioned.fill(child: Image.memory(thumbData, fit: BoxFit.cover)),
            if (entity.type == AssetType.video)
              Positioned(
                right: 12,
                bottom: 12,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.54),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    child: Text(_getTime(entity.videoDuration), style: durationStyle),
                  ),
                ),
              ),
          ],
        ),
      );
    }

    return previews;
  }

  String _getTime(Duration videoDuration) {
    final DateTime dummyDate = DateTime(1990).add(videoDuration);
    return DateFormat.ms().format(dummyDate);
  }

  Future<String?> _getFileSize(File? file, {int decimals = 0}) async {
    if (file == null) return null;
    final int bytes = await file.length();
    if (bytes <= 0) return '0 B';
    const List<String> suffixes = <String>['B', 'KB', 'MB', 'GB'];
    final int i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  Future<void> _onItemTapped(BuildContext context, AssetEntity item) async {
    switch (widget.mode) {
      case _MediaPickerMode.singleImage:
        if (item.type != AssetType.image) return;
        final AppMediaFile mediaFile = await _mapEntityToMediaFile(item);
        if (!context.mounted) return;
        Navigator.pop(context, mediaFile);
      case _MediaPickerMode.multipleMedia:
        _updateSelectedEntities(item);
    }
  }

  void _updateSelectedEntities(AssetEntity item) {
    setState(() {
      if (_selectedEntities.contains(item)) {
        _selectedEntities.remove(item);
      } else {
        _selectedEntities.add(item);
      }
    });
  }

  Future<void> _onReadyTapped(BuildContext context) async {
    final List<AppMediaFile> selectedFiles = await _mapEntitiesInChunks(_selectedEntities);
    if (!context.mounted) return;
    Navigator.pop(context, selectedFiles);
  }

  Future<List<AppMediaFile>> _mapEntitiesInChunks(
    List<AssetEntity> entities, {
    int chunkSize = 10,
  }) async {
    final List<AppMediaFile> result = <AppMediaFile>[];
    for (int i = 0; i < entities.length; i += chunkSize) {
      final Iterable<AssetEntity> chunk = entities.skip(i).take(chunkSize);
      final List<AppMediaFile> chunkResults = await Future.wait(chunk.map(_mapEntityToMediaFile));
      result.addAll(chunkResults);
    }
    return result;
  }

  Future<AppMediaFile> _mapEntityToMediaFile(AssetEntity selectedEntity) async {
    final AppMediaFileType type = switch (selectedEntity.type) {
      AssetType.image => AppMediaFileType.image,
      AssetType.video => AppMediaFileType.video,
      _ => throw UnsupportedError('Not supported file type ${selectedEntity.type}'),
    };
    final File? file = await selectedEntity.file;
    final Uint8List? cover = await selectedEntity.thumbnailDataWithSize(
      const ThumbnailSize.square(200),
    );
    final Duration? duration = switch (type) {
      AppMediaFileType.image => null,
      AppMediaFileType.video => selectedEntity.videoDuration,
    };
    final String? fileSize = await _getFileSize(file);
    final String fileName = await _getFileName(selectedEntity);

    return AppMediaFile(
      fileType: type,
      cover: cover,
      name: fileName,
      file: file,
      fileSize: fileSize,
      duration: duration,
    );
  }

  Future<String> _getFileName(AssetEntity entity) async {
    if (entity.title?.isNotEmpty == true) {
      return entity.title ?? '';
    }
    final File? originFile = await entity.originFileWithSubtype;
    return (originFile?.path ?? '').split(Platform.pathSeparator).last;
  }

  Future<void> _onAlbumSelected(AssetPathEntity selected) async {
    if (selected == _selectedAlbum) return;
    _canRequestNextPage = true;
    setState(() {
      _selectedAlbum = selected;
      _entities.clear();
      _previews.clear();
      currentPage = 0;
      _isEntitiesNotFound = false;
    });
    await _fetchGrantedMedia();
  }

  Future<Map<AssetEntity, Uint8List?>> _getThumbsDataMap(List<AssetEntity> entities) async {
    const ThumbnailSize thumbSize = ThumbnailSize(200, 200);
    final List<Future<MapEntry<AssetEntity, Uint8List?>>> futures = entities.map((
      AssetEntity entity,
    ) async {
      try {
        final Uint8List? data = await entity.thumbnailDataWithSize(thumbSize);
        return MapEntry<AssetEntity, Uint8List?>(entity, data);
      } on Object {
        return MapEntry<AssetEntity, Uint8List?>(entity, null);
      }
    }).toList();

    final List<MapEntry<AssetEntity, Uint8List?>> entries = await Future.wait(futures);
    return Map<AssetEntity, Uint8List?>.fromEntries(entries);
  }
}

class _PermissionDeniedContent extends StatelessWidget {
  const _PermissionDeniedContent();

  @override
  Widget build(BuildContext context) {
    final AppMediaFilePickerLabels labels = _AppMediaFilePickerScope.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            labels.accessDeniedNote,
            textAlign: TextAlign.center,
            style: context.message?.copyWith(color: context.colors.text.secondary),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: CommonAccentButton(
            title: labels.openAppSettings,
            onTapped: () => unawaited(PhotoManager.openSetting()),
          ),
        ),
      ],
    );
  }
}

class _EmptyCatalogue extends StatelessWidget {
  const _EmptyCatalogue();

  @override
  Widget build(BuildContext context) {
    final AppMediaFilePickerLabels labels = _AppMediaFilePickerScope.of(context);

    return Center(
      child: Text(
        labels.emptyAlbumsNote,
        textAlign: TextAlign.center,
        style: context.message?.copyWith(color: context.colors.text.secondary),
      ),
    );
  }
}
