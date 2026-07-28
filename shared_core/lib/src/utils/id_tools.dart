import 'dart:convert';

import 'package:crypto/crypto.dart';

/// Deterministic identifier from unordered string parts (SHA-256).
final class DeterministicId {
  const DeterministicId._();

  static String fromParts(Iterable<String> parts) {
    final List<String> sorted = List<String>.of(parts)..sort();
    final List<int> bytes = utf8.encode(sorted.join(','));
    return sha256.convert(bytes).toString();
  }
}
