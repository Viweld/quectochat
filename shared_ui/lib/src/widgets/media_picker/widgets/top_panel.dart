part of '../app_media_file_picker.dart';

class _TopPickerPanel extends StatelessWidget {
  const _TopPickerPanel({
    required this.mode,
    required this.albums,
    required this.selectedAlbum,
    required this.onAlbumSelected,
  });

  final _MediaPickerMode mode;
  final List<AssetPathEntity> albums;
  final AssetPathEntity? selectedAlbum;
  final ValueChanged<AssetPathEntity> onAlbumSelected;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: BorderDirectional(bottom: BorderSide(color: context.colors.border.main)),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 56),
        child: Row(
          children: <Widget>[
            const SizedBox(width: 56),
            Expanded(
              child: albums.isEmpty
                  ? const SizedBox()
                  : ConstrainedBox(
                      constraints: const BoxConstraints(minHeight: 56),
                      child: Center(
                        child: _AlbumSelectButton(mode: mode, onAlbumSelected: onAlbumSelected),
                      ),
                    ),
            ),
            SizedBox(
              width: 56,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: AppIcons.close(color: context.colors.icon.main),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AlbumSelectButton extends StatefulWidget {
  const _AlbumSelectButton({required this.mode, required this.onAlbumSelected});

  final _MediaPickerMode mode;
  final ValueChanged<AssetPathEntity> onAlbumSelected;

  @override
  State<_AlbumSelectButton> createState() => _AlbumSelectButtonState();
}

class _AlbumSelectButtonState extends State<_AlbumSelectButton> {
  List<AssetPathEntity> _albums = <AssetPathEntity>[];
  AssetPathEntity? _selectedAlbum;
  bool _isLoading = true;
  final GlobalKey _dropdownKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    unawaited(_checkAndLoadAlbums());
  }

  Future<void> _checkAndLoadAlbums() async {
    final PermissionState permission = await PhotoManager.requestPermissionExtend();
    if (permission.isAuth) {
      await _loadAlbums();
    } else {
      PhotoManager.addChangeCallback(_onPhotoChange);
      unawaited(PhotoManager.startChangeNotify());
    }
  }

  Future<void> _onPhotoChange(MethodCall call) async {
    if (call.method == 'change') {
      final PermissionState permission = await PhotoManager.requestPermissionExtend();
      if (permission.isAuth) {
        PhotoManager.removeChangeCallback(_onPhotoChange);
        unawaited(PhotoManager.stopChangeNotify());
        await _loadAlbums();
      }
    }
  }

  @override
  void dispose() {
    PhotoManager.removeChangeCallback(_onPhotoChange);
    unawaited(PhotoManager.stopChangeNotify());
    super.dispose();
  }

  Future<void> _loadAlbums() async {
    final RequestType requestType = switch (widget.mode) {
      _MediaPickerMode.singleImage => RequestType.image,
      _MediaPickerMode.multipleMedia => RequestType.common,
    };
    final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: requestType,
      filterOption: FilterOptionGroup(orders: <OrderOption>[const OrderOption()]),
    );
    if (!mounted) return;
    setState(() {
      _albums = albums;
      _selectedAlbum = albums.firstOrNull;
      _isLoading = false;
    });
    final AssetPathEntity? selected = _selectedAlbum;
    if (selected != null) {
      widget.onAlbumSelected(selected);
    }
  }

  void _showDropdownMenu() {
    final RenderBox renderBox = _dropdownKey.currentContext!.findRenderObject()! as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double menuWidth = screenWidth * 0.5;
    final double left = (screenWidth - menuWidth) / 2;
    final double top = offset.dy + size.height;

    unawaited(
      showMenu<void>(
        context: context,
        position: RelativeRect.fromLTRB(left, top, left, 0),
        constraints: BoxConstraints(maxHeight: 300, maxWidth: menuWidth),
        color: context.colors.background.secondary,
        menuPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Values.buttonBorderRadius),
        ),
        items: List<PopupMenuEntry<void>>.generate(_albums.length, (int index) {
          final AssetPathEntity album = _albums.elementAt(index);
          return PopupMenuItem<void>(
            padding: EdgeInsets.zero,
            onTap: () => _onItemTapped(album),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (index > 0)
                  Divider(color: context.colors.border.main, height: 0, thickness: 0.5),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              album.name,
                              overflow: TextOverflow.ellipsis,
                              style: context.username.copyWith(color: context.colors.text.strong),
                            ),
                            FutureBuilder<int>(
                              future: album.assetCountAsync,
                              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                                return Text(
                                  snapshot.connectionState != ConnectionState.done
                                      ? ' '
                                      : '${snapshot.data ?? 0}',
                                  style: context.caption.copyWith(
                                    color: context.colors.text.secondary,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      FutureBuilder<List<AssetEntity>>(
                        future: album.getAssetListRange(start: 0, end: 1),
                        builder: (BuildContext context, AsyncSnapshot<List<AssetEntity>> snapshot) {
                          final AssetEntity? thumb = snapshot.data?.isNotEmpty == true
                              ? snapshot.data!.first
                              : null;
                          if (thumb == null) {
                            return const SizedBox(width: 40, height: 40);
                          }
                          return FutureBuilder<Uint8List?>(
                            future: thumb.thumbnailDataWithSize(const ThumbnailSize(40, 40)),
                            builder: (BuildContext context, AsyncSnapshot<Uint8List?> snap) {
                              if (snap.connectionState != ConnectionState.done ||
                                  snap.data == null) {
                                return const SizedBox(width: 40, height: 40);
                              }
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.memory(
                                  snap.data!,
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      key: _dropdownKey,
      onTap: _showDropdownMenu,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (_selectedAlbum != null)
            Flexible(
              child: Text(
                _selectedAlbum!.name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: context.username.copyWith(color: context.colors.text.strong),
              ),
            ),
          Icon(Icons.keyboard_arrow_down, color: context.colors.icon.secondary, size: 16),
        ],
      ),
    );
  }

  void _onItemTapped(AssetPathEntity album) {
    setState(() => _selectedAlbum = album);
    widget.onAlbumSelected(album);
  }
}
