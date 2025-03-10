import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';
import 'package:quectochat/presentation/values/qicons.dart';

import '../../../../../../domain/models/message.dart';
import 'cluster_attribute.dart';

class RightMessage extends StatelessWidget {
  const RightMessage({
    required this.message,
    required this.backgroundColor,
    required this.clusterAttribute,
    super.key,
  });

  final Message message;
  final Color backgroundColor;
  final ClusterAttribute? clusterAttribute;

  static const double radius = 20;
  static const double radiusMini = 6;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Stack(
        children: [
          switch (clusterAttribute) {
            ClusterAttribute.first => Padding(
                padding: const EdgeInsets.only(
                  right: _RightStartBubbleClip.tailWidth,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(radius),
                    topRight: Radius.circular(radius),
                    bottomLeft: Radius.circular(radius),
                    bottomRight: Radius.circular(radiusMini),
                  ),
                  child: _MessageContent(
                    message: message,
                    backgroundColor: backgroundColor,
                  ),
                ),
              ),
            ClusterAttribute.middle => Padding(
                padding: const EdgeInsets.only(
                  right: _RightStartBubbleClip.tailWidth,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(radius),
                    topRight: Radius.circular(radiusMini),
                    bottomLeft: Radius.circular(radius),
                    bottomRight: Radius.circular(radiusMini),
                  ),
                  child: _MessageContent(
                    message: message,
                    backgroundColor: backgroundColor,
                  ),
                ),
              ),
            ClusterAttribute.last => ClipPath(
                clipper: const _RightStartBubbleClip.lastInCluster(),
                child: _MessageContent(
                  message: message,
                  backgroundColor: backgroundColor,
                  withTail: true,
                ),
              ),
            _ => ClipPath(
                clipper: const _RightStartBubbleClip.single(),
                child: _MessageContent(
                  message: message,
                  backgroundColor: backgroundColor,
                  withTail: true,
                ),
              ),
          },
          Positioned(
            bottom: 10,
            right: 20,
            child: Icon(
              message.isViewed ? Qicons.checkTwin : Qicons.check,
              size: 12,
              color: context.palette.greenDark,
            ),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
/// Контент сообщения
class _MessageContent extends StatelessWidget {
  const _MessageContent({
    required this.message,
    required this.backgroundColor,
    this.withTail = false,
  });

  final Message message;
  final Color backgroundColor;
  final bool withTail;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: Padding(
        padding: EdgeInsets.only(
          top: 12,
          bottom: 12,
          left: 14,
          right: withTail ? 34 : 24,
        ),
        child: Stack(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: message.content,
                    style: context.style14w500$message!.copyWith(
                      color: context.palette.greenDark,
                    ),
                  ),
                  const WidgetSpan(child: SizedBox(width: 40))
                ],
              ),
            ),
            Positioned(
              bottom: -2,
              right: 0,
              child: Text(
                DateFormat('HH:mm').format(message.createdAt),
                style: context.style12w500$labels!.copyWith(
                  fontFeatures: [const FontFeature.tabularFigures()],
                  color: context.palette.greenDark.withValues(alpha: 0.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
/// Фигурная обрезка пузырька сообщения
class _RightStartBubbleClip extends CustomClipper<Path> {
  const _RightStartBubbleClip.single() : _topRightRadius = regularRadius;

  const _RightStartBubbleClip.lastInCluster() : _topRightRadius = 6;

  final double _topRightRadius;

  static const double regularRadius = 20; // Радиус скругления углов
  static const double tailWidth = 10; // Ширина хвостика
  static const double tailHeight = 20; // Высота хвостика

  @override
  Path getClip(Size size) {
    return _getPath(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

  Path _getPath(Size size) {
    final double width = size.width; // Ширина контейнера
    final double height = size.height; // Высота контейнера

    return Path()
      ..arcTo(
          Rect.fromCenter(
            center: Offset(width, height - tailHeight),
            width: 2 * tailWidth,
            height: 2 * tailHeight,
          ),
          pi / 2,
          pi / 2,
          false)
      ..lineTo(width - tailWidth, regularRadius)
      ..arcTo(
          Rect.fromCircle(
            center: Offset(
              width - _topRightRadius - tailWidth,
              _topRightRadius,
            ),
            radius: _topRightRadius,
          ),
          0,
          -pi / 2,
          false)
      ..lineTo(regularRadius, 0)
      ..arcTo(
          Rect.fromCircle(
            center: const Offset(regularRadius, regularRadius),
            radius: regularRadius,
          ),
          -pi / 2,
          -pi / 2,
          false)
      ..lineTo(0, height - regularRadius)
      ..arcTo(
          Rect.fromCircle(
            center: Offset(regularRadius, height - regularRadius),
            radius: regularRadius,
          ),
          -pi,
          -pi / 2,
          false)
      ..close();
  }
}
