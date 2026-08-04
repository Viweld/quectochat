// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:collection/collection.dart' as _i4;
import 'package:flutter/material.dart' as _i3;
import 'package:viewers/presentation/image_viewer_screen/image_viewer_screen.dart'
    as _i1;

/// generated route for
/// [_i1.ImageViewerScreen]
class ImageViewerRoute extends _i2.PageRouteInfo<ImageViewerRouteArgs> {
  ImageViewerRoute({
    required List<String> imageUrls,
    required String initialUrl,
    String? heroTag,
    _i3.Key? key,
    List<_i2.PageRouteInfo>? children,
  }) : super(
         ImageViewerRoute.name,
         args: ImageViewerRouteArgs(
           imageUrls: imageUrls,
           initialUrl: initialUrl,
           heroTag: heroTag,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'ImageViewerRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImageViewerRouteArgs>();
      return _i1.ImageViewerScreen(
        imageUrls: args.imageUrls,
        initialUrl: args.initialUrl,
        heroTag: args.heroTag,
        key: args.key,
      );
    },
  );
}

class ImageViewerRouteArgs {
  const ImageViewerRouteArgs({
    required this.imageUrls,
    required this.initialUrl,
    this.heroTag,
    this.key,
  });

  final List<String> imageUrls;

  final String initialUrl;

  final String? heroTag;

  final _i3.Key? key;

  @override
  String toString() {
    return 'ImageViewerRouteArgs{imageUrls: $imageUrls, initialUrl: $initialUrl, heroTag: $heroTag, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ImageViewerRouteArgs) return false;
    return const _i4.ListEquality<String>().equals(
          imageUrls,
          other.imageUrls,
        ) &&
        initialUrl == other.initialUrl &&
        heroTag == other.heroTag &&
        key == other.key;
  }

  @override
  int get hashCode =>
      const _i4.ListEquality<String>().hash(imageUrls) ^
      initialUrl.hashCode ^
      heroTag.hashCode ^
      key.hashCode;
}
