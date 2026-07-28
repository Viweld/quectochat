extension IterableModifier<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E) test) =>
      cast<E?>().firstWhere((E? value) => value != null && test(value), orElse: () => null);
}

extension IterableAddUnique<T> on List<T> {
  /// Adds items that are not already present in this list.
  Iterable<T> addUniqueIterable(Iterable<T> items) sync* {
    final Set<T> asSet = toSet();
    yield* this;
    for (final T newItem in items) {
      if (!asSet.contains(newItem)) {
        yield newItem;
      }
    }
  }

  /// Whether any of [items] is already present in this list.
  bool containsAny(Iterable<T> items) {
    final Set<T> asSet = toSet();
    for (final T newItem in items) {
      if (asSet.contains(newItem)) {
        return true;
      }
    }
    return false;
  }
}
