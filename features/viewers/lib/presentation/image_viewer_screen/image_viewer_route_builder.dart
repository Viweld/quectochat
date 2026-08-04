import 'package:flutter/material.dart';
import 'package:shared_core/core.dart';

/// Transparent fade route so [Hero] flights stay visible while the viewer opens.
Route<T> buildImageViewerRoute<T>(BuildContext context, Widget child, AutoRoutePage<T> page) {
  return PageRouteBuilder<T>(
    settings: page,
    opaque: false,
    barrierColor: Colors.transparent,
    transitionDuration: const Duration(milliseconds: 280),
    reverseTransitionDuration: const Duration(milliseconds: 240),
    pageBuilder:
        (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) =>
            child,
    transitionsBuilder:
        (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          // Keep the page itself fully opaque for Hero; backdrop fades inside the screen.
          return child;
        },
  );
}
