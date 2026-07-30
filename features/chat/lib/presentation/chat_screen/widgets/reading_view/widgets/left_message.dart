import 'dart:math';

import 'package:chat/domain/entities/message.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/widgets/cluster_attribute.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/widgets/message_bubble_content.dart';
import 'package:flutter/material.dart';

class LeftMessage extends StatelessWidget {
  const LeftMessage({
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
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * MessageBubbleContent.defaultMaxWidthFactor,
        ),
        child: switch (clusterAttribute) {
          ClusterAttribute.first => Padding(
            padding: const EdgeInsets.only(left: _LeftStartBubbleClip.tailWidth),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(radius),
                topRight: Radius.circular(radius),
                bottomLeft: Radius.circular(radiusMini),
                bottomRight: Radius.circular(radius),
              ),
              child: MessageBubbleContent(
                message: message,
                backgroundColor: backgroundColor,
                padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
              ),
            ),
          ),
          ClusterAttribute.middle => Padding(
            padding: const EdgeInsets.only(left: _LeftStartBubbleClip.tailWidth),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(radiusMini),
                topRight: Radius.circular(radius),
                bottomLeft: Radius.circular(radiusMini),
                bottomRight: Radius.circular(radius),
              ),
              child: MessageBubbleContent(
                message: message,
                backgroundColor: backgroundColor,
                padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
              ),
            ),
          ),
          ClusterAttribute.last => ClipPath(
            clipper: const _LeftStartBubbleClip.lastInCluster(),
            child: MessageBubbleContent(
              message: message,
              backgroundColor: backgroundColor,
              padding: const EdgeInsets.fromLTRB(24, 12, 14, 12),
            ),
          ),
          _ => ClipPath(
            clipper: const _LeftStartBubbleClip.single(),
            child: MessageBubbleContent(
              message: message,
              backgroundColor: backgroundColor,
              padding: const EdgeInsets.fromLTRB(24, 12, 14, 12),
            ),
          ),
        },
      ),
    );
  }
}

/// Фигурная обрезка пузырька сообщения
class _LeftStartBubbleClip extends CustomClipper<Path> {
  const _LeftStartBubbleClip.single() : _topLeftRadius = regularRadius;

  const _LeftStartBubbleClip.lastInCluster() : _topLeftRadius = 6;

  final double _topLeftRadius;

  static const double regularRadius = 20;
  static const double tailWidth = 10;
  static const double tailHeight = 20;

  @override
  Path getClip(Size size) {
    return _getPath(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

  Path _getPath(Size size) {
    final double width = size.width;
    final double height = size.height;

    return Path()
      ..arcTo(
        Rect.fromCenter(
          center: Offset(0, height - tailHeight),
          width: 2 * tailWidth,
          height: 2 * tailHeight,
        ),
        pi / 2,
        -pi / 2,
        false,
      )
      ..lineTo(tailWidth, regularRadius)
      ..arcTo(
        Rect.fromCircle(
          center: Offset(tailWidth + _topLeftRadius, _topLeftRadius),
          radius: _topLeftRadius,
        ),
        pi,
        pi / 2,
        false,
      )
      ..lineTo(width - regularRadius, 0)
      ..arcTo(
        Rect.fromCircle(
          center: Offset(width - regularRadius, regularRadius),
          radius: regularRadius,
        ),
        -pi / 2,
        pi / 2,
        false,
      )
      ..lineTo(width, height - regularRadius)
      ..arcTo(
        Rect.fromCircle(
          center: Offset(width - regularRadius, height - regularRadius),
          radius: regularRadius,
        ),
        0,
        pi / 2,
        false,
      )
      ..close();
  }
}
