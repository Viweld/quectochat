import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shared_ui/src/values/values.dart';

/// Имя пакета `shared_ui` для [SvgPicture.asset] / [Image.asset].
const String kPackageName = 'shared_ui';

/// Базовый путь к SVG-иконкам в ассетах пакета.
const String kIconsPath = 'resources/icons/';

/// Базовый путь к растровым изображениям в ассетах пакета.
const String kImagesPath = 'resources/images/';

/// Обёртка над SVG-ассетом с единым API размера, цвета и тапа.
class AppIcon {
  final String? _svgAsset;

  const AppIcon._({String? svgAsset}) : _svgAsset = svgAsset;

  const AppIcon.asset(String assetKey) : this._(svgAsset: assetKey);

  String get asset => _svgAsset ?? '';

  Widget call({
    Color? color,
    double size = Values.defaultIconSize,
    BoxFit? fit,
    VoidCallback? onTap,
    double padding = 0,
  }) {
    final double splashRadius = (size / 2) + padding + 8;
    final double splashDiameter = splashRadius * 2;

    return Builder(
      builder: (BuildContext context) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(padding),
              child: _svgAsset == null
                  ? const SizedBox.shrink()
                  : SvgPicture.asset(
                      _svgAsset,
                      package: kPackageName,
                      colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
                      fit: fit ?? BoxFit.scaleDown,
                      height: size,
                      width: size,
                    ),
            ),
            Positioned(
              width: splashDiameter,
              height: splashDiameter,
              child: Theme(
                data: onTap != null
                    ? Theme.of(context)
                    : Theme.of(context).copyWith(
                        splashFactory: NoSplash.splashFactory,
                        highlightColor: Colors.transparent,
                      ),
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.all(Radius.circular(splashRadius)),
                  clipBehavior: Clip.hardEdge,
                  child: InkResponse(
                    borderRadius: BorderRadius.all(Radius.circular(splashRadius)),
                    radius: splashRadius,
                    onTap: onTap,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
