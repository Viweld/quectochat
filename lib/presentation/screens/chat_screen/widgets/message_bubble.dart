import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    required this.text,
    required this.createdAt,
    super.key,
  });

  final String text;
  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    final textStyle = context.style14w500$message!.copyWith(
      color: context.palette.greenDark,
    );
    final time = DateFormat('HH:mm').format(createdAt);
    final timeStyle = context.style12w500$labels!.copyWith(
      color: context.palette.greenDark,
    );

    final lastLineWidth = _calculateLastLineWidth(
      text: text,
      style: textStyle,
      textScaler: MediaQuery.textScalerOf(context),
    );

    final timeWidth = _calculateLastLineWidth(
      text: time,
      style: timeStyle,
      textScaler: MediaQuery.textScalerOf(context),
    );

    return Align(
      alignment: Alignment.centerRight,
      child: ClipPath(
        clipper: _RightStartBubbleClip(),
        child: ColoredBox(
          color: context.palette.green,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 12,
              bottom: 12,
              left: 16,
              right: 26,
            ),
            child: LayoutBuilder(
              builder: (context, c) {
                final space = c.maxWidth - lastLineWidth - timeWidth;
                print(space);
                return RichText(
                  textWidthBasis: TextWidthBasis.longestLine,
                  text: TextSpan(
                    children: [
                      TextSpan(text: text, style: textStyle),
                      if (space > 0) WidgetSpan(child: SizedBox(width: space)),
                      WidgetSpan(
                        child: Text(time, style: timeStyle),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  /// Рассчитывает полную длину текстовой строки
  double _calculateLastLineWidth({
    required String text,
    required TextStyle style,
    required TextScaler textScaler,
  }) {
    final textSpan = TextSpan(text: text, style: style);
    final textPainter = TextPainter(
      text: textSpan,
      textScaler: textScaler,
      textDirection: ui.TextDirection.ltr,
    )..layout();
    return textPainter.computeLineMetrics().last.width;
  }
}

class _LeftStartBubbleClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return _getPath(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

  Path _getPath(Size size) {
    final double W = size.width; // ширина контейнера
    final double H = size.height; // высота контейнера
    const double R = 20;
    const double r = 6;
    const double pw = 10;
    const double ph = 20;

    return Path()
      ..arcTo(
          Rect.fromCenter(
            center: Offset(0, H - ph),
            width: 2 * pw,
            height: 2 * ph,
          ),
          pi / 2,
          -pi / 2,
          false)
      ..lineTo(pw, R)
      ..arcTo(
          Rect.fromCircle(
            center: const Offset(pw + R, R),
            radius: R,
          ),
          pi,
          pi / 2,
          false)
      ..lineTo(W - R, 0)
      ..arcTo(
          Rect.fromCircle(
            center: Offset(W - R, R),
            radius: R,
          ),
          -pi / 2,
          pi / 2,
          false)
      ..lineTo(W, H - R)
      ..arcTo(
          Rect.fromCircle(
            center: Offset(W - R, H - R),
            radius: R,
          ),
          0,
          pi / 2,
          false)
      ..close();
  }
}

class _RightStartBubbleClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return _getPath(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

  Path _getPath(Size size) {
    final double W = size.width; // ширина контейнера
    final double H = size.height; // высота контейнера
    const double R = 20;
    const double r = 6;
    const double pw = 10;
    const double ph = 20;

    return Path()
      ..arcTo(
          Rect.fromCenter(
            center: Offset(W, H - ph),
            width: 2 * pw,
            height: 2 * ph,
          ),
          pi / 2,
          pi / 2,
          false)
      ..lineTo(W - pw, R)
      ..arcTo(
          Rect.fromCircle(
            center: Offset(W - R - pw, R),
            radius: R,
          ),
          0,
          -pi / 2,
          false)
      ..lineTo(R, 0)
      ..arcTo(
          Rect.fromCircle(
            center: const Offset(R, R),
            radius: R,
          ),
          -pi / 2,
          -pi / 2,
          false)
      ..lineTo(0, H - R)
      ..arcTo(
          Rect.fromCircle(
            center: Offset(R, H - R),
            radius: R,
          ),
          -pi,
          -pi / 2,
          false)
      ..close();
  }
}
