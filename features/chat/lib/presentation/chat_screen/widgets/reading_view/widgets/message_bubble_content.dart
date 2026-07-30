import 'dart:math';

import 'package:chat/domain/entities/message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:shared_ui/core_ui.dart';

/// Message body that respects a parent max-width cap, then shrinks to the
/// longest wrapped line (+ horizontal padding) instead of stretching to the cap.
class MessageBubbleContent extends StatelessWidget {
  const MessageBubbleContent({
    required this.message,
    required this.backgroundColor,
    required this.padding,
    super.key,
  });

  final Message message;
  final Color backgroundColor;
  final EdgeInsets padding;

  /// Default share of the screen width a bubble may occupy.
  static const double defaultMaxWidthFactor = 0.75;

  /// Space reserved at the end of the text flow for the timestamp overlay.
  static const double trailingTimeReserve = 40;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final TextStyle textStyle = context.message!.copyWith(
          color: context.colors.chat.bubbleOwnText,
        );
        final double maxBubbleWidth = constraints.maxWidth;
        final double maxTextWidth = max(0, maxBubbleWidth - padding.horizontal);
        final double textBlockWidth = _LongestLineWidth.measure(
          text: message.content,
          style: textStyle,
          maxWidth: maxTextWidth,
          trailingReserve: trailingTimeReserve,
          textDirection: Directionality.of(context),
          textScaler: MediaQuery.textScalerOf(context),
        );

        return ColoredBox(
          color: backgroundColor,
          child: Padding(
            padding: padding,
            child: SizedBox(
              width: textBlockWidth,
              child: Stack(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: <InlineSpan>[
                        TextSpan(text: message.content, style: textStyle),
                        const WidgetSpan(child: SizedBox(width: trailingTimeReserve)),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -2,
                    right: 0,
                    child: Text(
                      DateFormat('HH:mm').format(message.createdAt),
                      style: context.caption!.copyWith(
                        fontFeatures: <FontFeature>[const FontFeature.tabularFigures()],
                        color: context.colors.chat.bubbleOwnText.withValues(alpha: 0.8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Measures the width of the longest line after wrapping at a given max width.
abstract final class _LongestLineWidth {
  static double measure({
    required String text,
    required TextStyle style,
    required double maxWidth,
    required double trailingReserve,
    required TextDirection textDirection,
    required TextScaler textScaler,
  }) {
    if (maxWidth <= 0) return 0;

    final TextPainter painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: textDirection,
      textScaler: textScaler,
    )..layout(maxWidth: maxWidth);

    final List<LineMetrics> lines = painter.computeLineMetrics();
    if (lines.isEmpty) {
      return min(trailingReserve, maxWidth);
    }

    double longest = 0;
    for (int i = 0; i < lines.length; i++) {
      final double lineWidth = lines[i].width;
      if (i == lines.length - 1) {
        final double withTrailing = lineWidth + trailingReserve;
        if (withTrailing <= maxWidth) {
          longest = max(longest, withTrailing);
        } else {
          // Trailing reserve wraps onto its own line (same as WidgetSpan behaviour).
          longest = max(longest, lineWidth);
          longest = max(longest, trailingReserve);
        }
      } else {
        longest = max(longest, lineWidth);
      }
    }

    return min(longest, maxWidth);
  }
}
