import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

class SwipeClearWrapper extends StatefulWidget {
  const SwipeClearWrapper({required this.child, required this.onClearChatRequested, super.key});

  final Widget child;
  final void Function() onClearChatRequested;

  @override
  State<SwipeClearWrapper> createState() => _SwipeClearWrapperState();
}

class _SwipeClearWrapperState extends State<SwipeClearWrapper> with SingleTickerProviderStateMixin {
  double _dragExtent = 0.0;
  bool _triggered = false;
  late AnimationController _waveController;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dismissThreshold = screenWidth * 0.4;

    // Интерполируем цвет от серого к красному
    final Color? backgroundColor = Color.lerp(
      context.colors.text.tertiary,
      context.colors.feedback.error,
      (_dragExtent / dismissThreshold).clamp(0, 1),
    );

    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        setState(() {
          _dragExtent -= details.primaryDelta ?? 0;
          _dragExtent = _dragExtent.clamp(0, screenWidth);

          if (_dragExtent >= dismissThreshold && !_triggered) {
            _triggered = true;
            _waveController.forward(from: 0); // Запуск анимации волн
          }
        });
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        if (_dragExtent >= dismissThreshold) {
          widget.onClearChatRequested();
        }
        setState(() {
          _dragExtent = 0;
          _triggered = false;
        });
      },
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: ColoredBox(
              color: backgroundColor!,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomPaint(
                    painter: WavePainter(_waveController.value),
                    child: Text(
                      context.texts.homeClearChatLabel,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(offset: Offset(-_dragExtent, 0), child: widget.child),
        ],
      ),
    );
  }
}

// Радиальные круги вокруг текста
class WavePainter extends CustomPainter {
  final double progress;

  WavePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    if (progress == 0) return;

    final Paint paint = Paint()
      ..color = Colors.white.withValues(alpha: 1 - progress)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    const double maxRadius = 40;
    const double minRadius = 20;

    for (int i = 0; i < 3; i++) {
      final double radius = minRadius + (maxRadius - minRadius) * (progress - i * 0.3);
      if (radius > minRadius) {
        canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
