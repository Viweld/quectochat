import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';
import 'package:viewers/presentation/image_viewer_screen/widgets/image_viewer_page_indicators.dart';

/// Fullscreen zoomable image gallery (adapted from vipgate GalleryViewScreen).
@RoutePage()
class ImageViewerScreen extends StatefulWidget {
  const ImageViewerScreen({
    required this.imageUrls,
    required this.initialUrl,
    this.heroTag,
    super.key,
  });

  final List<String> imageUrls;
  final String initialUrl;

  /// Optional [Hero] tag matching the preview that opened this screen.
  final String? heroTag;

  @override
  State<ImageViewerScreen> createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  late final PageController _pageController;
  late final int _initialIndex;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _initialIndex = _resolveInitialIndex();
    _currentIndex = _initialIndex;
    _pageController = PageController(initialPage: _initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int _resolveInitialIndex() {
    final int index = widget.imageUrls.indexOf(widget.initialUrl);
    return index >= 0 ? index : 0;
  }

  void _handlePageChanged(int index) {
    setState(() => _currentIndex = index);
  }

  PhotoViewGalleryPageOptions _buildPageOptions(BuildContext context, int index) {
    final String url = widget.imageUrls[index];
    final String? heroTag = index == _initialIndex ? widget.heroTag : null;
    final Color inverseBackground = context.colors.background.inverse;

    return PhotoViewGalleryPageOptions(
      imageProvider: CachedNetworkImageProvider(url),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained,
      maxScale: PhotoViewComputedScale.covered * 4,
      heroAttributes: heroTag != null ? PhotoViewHeroAttributes(tag: heroTag) : null,
      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
        return ColoredBox(color: inverseBackground);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final Color inverseBackground = colors.background.inverse;
    final Animation<double> routeAnimation =
        ModalRoute.of(context)?.animation ?? const AlwaysStoppedAnimation<double>(1);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: inverseBackground,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: inverseBackground,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: inverseBackground,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            FadeTransition(
              opacity: CurvedAnimation(parent: routeAnimation, curve: Curves.easeOut),
              child: ColoredBox(color: inverseBackground),
            ),
            PhotoViewGallery.builder(
              pageController: _pageController,
              itemCount: widget.imageUrls.length,
              onPageChanged: _handlePageChanged,
              scrollPhysics: const ClampingScrollPhysics(),
              backgroundDecoration: BoxDecoration(color: inverseBackground),
              loadingBuilder: (BuildContext context, ImageChunkEvent? event) {
                return ColoredBox(
                  color: inverseBackground,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: colors.accent.main,
                      value: event == null
                          ? null
                          : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1),
                    ),
                  ),
                );
              },
              builder: _buildPageOptions,
            ),
            Positioned(
              top: MediaQuery.paddingOf(context).top + 8,
              left: 8,
              child: FadeTransition(
                opacity: routeAnimation,
                child: IconButton(
                  onPressed: () => appLocator<AppNavigator>().navigateBack(),
                  icon: Icon(Icons.chevron_left, color: colors.icon.inverse, size: 28),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: MediaQuery.paddingOf(context).bottom + 24,
              child: FadeTransition(
                opacity: routeAnimation,
                child: ImageViewerPageIndicators(
                  count: widget.imageUrls.length,
                  activeIndex: _currentIndex,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
