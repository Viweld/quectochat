import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';

import '../../../../../../domain/models/chat_message.dart';
import 'cluster_attribute.dart';

class LeftMessage extends StatelessWidget {
  const LeftMessage({
    required this.message,
    required this.backgroundColor,
    required this.clusterAttribute,
    super.key,
  });

  final ChatMessage message;
  final Color backgroundColor;
  final ClusterAttribute? clusterAttribute;

  static const double radius = 20;
  static const double radiusMini = 6;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: switch (clusterAttribute) {
          ClusterAttribute.first => Padding(
              padding: const EdgeInsets.only(
                left: _LeftStartBubbleClip.tailWidth,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(radius),
                  topRight: Radius.circular(radius),
                  bottomLeft: Radius.circular(radiusMini),
                  bottomRight: Radius.circular(radius),
                ),
                child: _MessageContent(
                  message: message,
                  backgroundColor: backgroundColor,
                ),
              ),
            ),
          ClusterAttribute.middle => Padding(
              padding: const EdgeInsets.only(
                left: _LeftStartBubbleClip.tailWidth,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(radiusMini),
                  topRight: Radius.circular(radius),
                  bottomLeft: Radius.circular(radiusMini),
                  bottomRight: Radius.circular(radius),
                ),
                child: _MessageContent(
                  message: message,
                  backgroundColor: backgroundColor,
                ),
              ),
            ),
          ClusterAttribute.last => ClipPath(
              clipper: const _LeftStartBubbleClip.lastInCluster(),
              child: _MessageContent(
                message: message,
                backgroundColor: backgroundColor,
              ),
            ),
          _ => ClipPath(
              clipper: const _LeftStartBubbleClip.single(),
              child: _MessageContent(
                message: message,
                backgroundColor: backgroundColor,
              ),
            ),
        });
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
  });

  final ChatMessage message;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 12,
          bottom: 12,
          left: 16,
          right: 26,
        ),
        child: Stack(
          children: [
            Text(
              '${message.content}           ',
              style: context.style14w500$message!.copyWith(
                color: context.palette.greenDark,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Text(
                DateFormat('HH:mm').format(message.createdAt),
                style: context.style12w500$labels!.copyWith(
                  color: context.palette.greenDark,
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
class _LeftStartBubbleClip extends CustomClipper<Path> {
  const _LeftStartBubbleClip.single() : _topLeftRadius = regularRadius;

  const _LeftStartBubbleClip.lastInCluster() : _topLeftRadius = 6;

  final double _topLeftRadius;

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
            center: Offset(0, height - tailHeight),
            width: 2 * tailWidth,
            height: 2 * tailHeight,
          ),
          pi / 2,
          -pi / 2,
          false)
      ..lineTo(tailWidth, regularRadius)
      ..arcTo(
          Rect.fromCircle(
            center: Offset(tailWidth + _topLeftRadius, _topLeftRadius),
            radius: _topLeftRadius,
          ),
          pi,
          pi / 2,
          false)
      ..lineTo(width - regularRadius, 0)
      ..arcTo(
          Rect.fromCircle(
            center: Offset(width - regularRadius, regularRadius),
            radius: regularRadius,
          ),
          -pi / 2,
          pi / 2,
          false)
      ..lineTo(width, height - regularRadius)
      ..arcTo(
          Rect.fromCircle(
            center: Offset(width - regularRadius, height - regularRadius),
            radius: regularRadius,
          ),
          0,
          pi / 2,
          false)
      ..close();
  }
}
