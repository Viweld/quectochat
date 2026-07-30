import 'dart:math';

import 'package:chat/domain/entities/message.dart';
import 'package:chat/domain/entities/message_status.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/widgets/cluster_attribute.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/widgets/message_bubble_content.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

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
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * MessageBubbleContent.defaultMaxWidthFactor,
        ),
        child: Stack(
          children: <Widget>[
            switch (clusterAttribute) {
              ClusterAttribute.first => Padding(
                padding: const EdgeInsets.only(right: _RightStartBubbleClip.tailWidth),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(radius),
                    topRight: Radius.circular(radius),
                    bottomLeft: Radius.circular(radius),
                    bottomRight: Radius.circular(radiusMini),
                  ),
                  child: MessageBubbleContent(
                    message: message,
                    backgroundColor: backgroundColor,
                    padding: const EdgeInsets.fromLTRB(14, 12, 24, 12),
                  ),
                ),
              ),
              ClusterAttribute.middle => Padding(
                padding: const EdgeInsets.only(right: _RightStartBubbleClip.tailWidth),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(radius),
                    topRight: Radius.circular(radiusMini),
                    bottomLeft: Radius.circular(radius),
                    bottomRight: Radius.circular(radiusMini),
                  ),
                  child: MessageBubbleContent(
                    message: message,
                    backgroundColor: backgroundColor,
                    padding: const EdgeInsets.fromLTRB(14, 12, 24, 12),
                  ),
                ),
              ),
              ClusterAttribute.last => ClipPath(
                clipper: const _RightStartBubbleClip.lastInCluster(),
                child: MessageBubbleContent(
                  message: message,
                  backgroundColor: backgroundColor,
                  padding: const EdgeInsets.fromLTRB(14, 12, 34, 12),
                ),
              ),
              _ => ClipPath(
                clipper: const _RightStartBubbleClip.single(),
                child: MessageBubbleContent(
                  message: message,
                  backgroundColor: backgroundColor,
                  padding: const EdgeInsets.fromLTRB(14, 12, 34, 12),
                ),
              ),
            },
            Positioned(
              bottom: 10,
              right: 20,
              child: Icon(
                message.status == MessageStatus.read ? Qicons.checkTwin : Qicons.check,
                size: 12,
                color: context.palette.greenDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Фигурная обрезка пузырька сообщения
class _RightStartBubbleClip extends CustomClipper<Path> {
  const _RightStartBubbleClip.single() : _topRightRadius = regularRadius;

  const _RightStartBubbleClip.lastInCluster() : _topRightRadius = 6;

  final double _topRightRadius;

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
          center: Offset(width, height - tailHeight),
          width: 2 * tailWidth,
          height: 2 * tailHeight,
        ),
        pi / 2,
        pi / 2,
        false,
      )
      ..lineTo(width - tailWidth, regularRadius)
      ..arcTo(
        Rect.fromCircle(
          center: Offset(width - _topRightRadius - tailWidth, _topRightRadius),
          radius: _topRightRadius,
        ),
        0,
        -pi / 2,
        false,
      )
      ..lineTo(regularRadius, 0)
      ..arcTo(
        Rect.fromCircle(center: const Offset(regularRadius, regularRadius), radius: regularRadius),
        -pi / 2,
        -pi / 2,
        false,
      )
      ..lineTo(0, height - regularRadius)
      ..arcTo(
        Rect.fromCircle(
          center: Offset(regularRadius, height - regularRadius),
          radius: regularRadius,
        ),
        -pi,
        -pi / 2,
        false,
      )
      ..close();
  }
}
