// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

extension DepProviderContextExtension on BuildContext {
  /// Obtain a value from the nearest ancestor DepProvider.
  GetIt get dep => DepProvider.of(this).dependencies;
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
class DepProvider extends InheritedWidget {
  const DepProvider({
    required this.dependencies,
    required super.child,
    super.key,
  });

  final GetIt dependencies;

  static DepProvider of(BuildContext context) {
    final DepProvider? dp =
        context.findAncestorWidgetOfExactType<DepProvider>();
    if (dp == null) {
      throw UnimplementedError('DepProvider is not initialized in context');
    }
    return dp;
  }

  // ---------------------------------------------------------------------------
  @override
  bool updateShouldNotify(DepProvider oldWidget) {
    return false;
  }
}
