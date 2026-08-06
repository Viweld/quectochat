import 'package:flutter/material.dart';

final class AppBackgroundColors {
  const AppBackgroundColors({required this.main, required this.secondary, required this.inverse});

  final Color main;
  final Color secondary;

  /// Scrim / fullscreen media backdrop (black in the light theme).
  final Color inverse;
}
