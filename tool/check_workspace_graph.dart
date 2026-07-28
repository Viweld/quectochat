// Workspace package DAG checker for target micro-modular architecture.
//
// Usage: fvm dart run tool/check_workspace_graph.dart
// Config: workspace_graph_config.yaml (repo root)

import 'dart:io';

import 'package:yaml/yaml.dart';

Future<void> main(List<String> args) async {
  final Directory repoRoot = _findRepoRoot(Directory.current);
  final File configFile = File('${repoRoot.path}/workspace_graph_config.yaml');
  if (!configFile.existsSync()) {
    stderr.writeln('Missing ${configFile.path}');
    exit(2);
  }

  final YamlMap config = loadYaml(await configFile.readAsString()) as YamlMap;
  final bool strict = config['strict'] == true;
  final List<_ForbiddenEdge> forbiddenEdges = _parseForbiddenEdges(config['forbidden_edges']);
  final List<_ImportWarning> importWarnings = _parseImportWarnings(config['warnings']);
  final List<_PathWarning> pathWarnings = _parsePathWarnings(config['warnings']);

  final Map<String, _WorkspacePackage> packages = await _discoverPackages(repoRoot);
  final List<String> errors = <String>[];
  final List<String> warnings = <String>[];

  for (final _WorkspacePackage package in packages.values) {
    _checkPubspecEdges(
      package: package,
      packages: packages,
      forbiddenEdges: forbiddenEdges,
      errors: errors,
    );

    await _checkDartImports(
      package: package,
      packages: packages,
      forbiddenEdges: forbiddenEdges,
      importWarnings: importWarnings,
      errors: errors,
      warnings: warnings,
    );

    _checkPathWarnings(package: package, pathWarnings: pathWarnings, warnings: warnings);
  }

  for (final String warning in warnings) {
    stdout.writeln('WARNING: $warning');
  }

  for (final String error in errors) {
    stderr.writeln('ERROR: $error');
  }

  if (strict && warnings.isNotEmpty) {
    stderr.writeln('Strict mode: ${warnings.length} warning(s) treated as failure.');
    exit(1);
  }

  if (errors.isNotEmpty) {
    stderr.writeln('Graph check failed with ${errors.length} error(s).');
    exit(1);
  }

  stdout.writeln(
    'Graph check passed (${packages.length} packages, ${warnings.length} warning(s)).',
  );
}

Directory _findRepoRoot(Directory start) {
  Directory? current = start.absolute;
  while (current != null) {
    if (File('${current.path}/pubspec.yaml').existsSync() &&
        File('${current.path}/workspace_graph_config.yaml').existsSync()) {
      return current;
    }
    current = current.parent;
  }

  return start.absolute;
}

Future<Map<String, _WorkspacePackage>> _discoverPackages(Directory repoRoot) async {
  final File rootPubspec = File('${repoRoot.path}/pubspec.yaml');
  final YamlMap root = loadYaml(await rootPubspec.readAsString()) as YamlMap;
  final YamlList? workspace = root['workspace'] as YamlList?;
  final Map<String, _WorkspacePackage> packages = <String, _WorkspacePackage>{};

  final String appName = root['name'] as String;
  packages[appName] = _WorkspacePackage(
    name: appName,
    directory: repoRoot,
    category: _PackageCategory.app,
    dependencies: await _readPubspecDependencies(rootPubspec),
  );

  if (workspace == null) {
    return packages;
  }

  for (final Object? entry in workspace) {
    final String relativePath = entry as String;
    final Directory packageDir = Directory('${repoRoot.path}/$relativePath');
    final File pubspecFile = File('${packageDir.path}/pubspec.yaml');
    if (!pubspecFile.existsSync()) {
      continue;
    }

    final YamlMap pubspec = loadYaml(await pubspecFile.readAsString()) as YamlMap;
    final String name = pubspec['name'] as String;
    packages[name] = _WorkspacePackage(
      name: name,
      directory: packageDir,
      category: _categoryForPath(relativePath, name),
      dependencies: await _readPubspecDependencies(pubspecFile),
    );
  }

  return packages;
}

Future<Set<String>> _readPubspecDependencies(File pubspecFile) async {
  final YamlMap pubspec = loadYaml(await pubspecFile.readAsString()) as YamlMap;
  final YamlMap? deps = pubspec['dependencies'] as YamlMap?;
  if (deps == null) {
    return <String>{};
  }

  return deps.keys.cast<String>().toSet();
}

_PackageCategory _categoryForPath(String relativePath, String name) {
  if (relativePath.startsWith('features/')) {
    return _PackageCategory.feature;
  }
  if (name.startsWith('shared_')) {
    return _PackageCategory.shared;
  }
  if (name == 'infrastructure') {
    return _PackageCategory.infrastructure;
  }
  if (name == 'navigation' || name == 'navigation_api') {
    return _PackageCategory.navigation;
  }
  if (name == 'domain' || name == 'data' || name == 'core' || name == 'core_ui') {
    return _PackageCategory.legacyGlobal;
  }

  return _PackageCategory.other;
}

List<_ForbiddenEdge> _parseForbiddenEdges(Object? raw) {
  if (raw is! YamlList) {
    return <_ForbiddenEdge>[];
  }

  return raw
      .map((Object? item) {
        final YamlMap map = item as YamlMap;
        return _ForbiddenEdge(
          fromPattern: map['from'] as String,
          toPattern: map['to'] as String,
          message: map['message'] as String? ?? 'Forbidden dependency edge.',
        );
      })
      .toList(growable: false);
}

List<_ImportWarning> _parseImportWarnings(Object? raw) {
  if (raw is! YamlList) {
    return <_ImportWarning>[];
  }

  return raw
      .where((Object? item) => (item as YamlMap)['import_prefix'] != null)
      .map((Object? item) {
        final YamlMap map = item as YamlMap;
        return _ImportWarning(
          id: map['id'] as String,
          fromPattern: map['from'] as String,
          importPrefix: map['import_prefix'] as String,
          message: map['message'] as String? ?? 'Import warning.',
        );
      })
      .toList(growable: false);
}

List<_PathWarning> _parsePathWarnings(Object? raw) {
  if (raw is! YamlList) {
    return <_PathWarning>[];
  }

  return raw
      .where((Object? item) => (item as YamlMap)['path_glob'] != null)
      .map((Object? item) {
        final YamlMap map = item as YamlMap;
        final YamlList patterns = map['forbidden_name_patterns'] as YamlList;
        return _PathWarning(
          id: map['id'] as String,
          fromPattern: map['from'] as String,
          pathGlob: map['path_glob'] as String,
          forbiddenNamePatterns: patterns.cast<String>(),
          message: map['message'] as String? ?? 'Path warning.',
        );
      })
      .toList(growable: false);
}

void _checkPubspecEdges({
  required _WorkspacePackage package,
  required Map<String, _WorkspacePackage> packages,
  required List<_ForbiddenEdge> forbiddenEdges,
  required List<String> errors,
}) {
  for (final String dependency in package.dependencies) {
    final _WorkspacePackage? target = packages[dependency];
    if (target == null) {
      continue;
    }

    for (final _ForbiddenEdge edge in forbiddenEdges) {
      if (_matchesPattern(package.category, edge.fromPattern, package.name) &&
          _matchesTargetPattern(target, edge.toPattern)) {
        errors.add('${package.name} pubspec → ${target.name}: ${edge.message}');
      }
    }
  }
}

Future<void> _checkDartImports({
  required _WorkspacePackage package,
  required Map<String, _WorkspacePackage> packages,
  required List<_ForbiddenEdge> forbiddenEdges,
  required List<_ImportWarning> importWarnings,
  required List<String> errors,
  required List<String> warnings,
}) async {
  final Directory libDir = Directory('${package.directory.path}/lib');
  if (!libDir.existsSync()) {
    return;
  }

  await for (final FileSystemEntity entity in libDir.list(recursive: true, followLinks: false)) {
    if (entity is! File || !entity.path.endsWith('.dart')) {
      continue;
    }

    final String content = await entity.readAsString();
    final String relativePath = entity.path.substring(package.directory.path.length + 1);

    for (final String line in content.split('\n')) {
      final String trimmed = line.trim();
      if (!trimmed.startsWith('import ') && !trimmed.startsWith('export ')) {
        continue;
      }

      final String? importUri = _extractPackageUri(trimmed);
      if (importUri == null) {
        continue;
      }

      final String? targetName = _packageNameFromUri(importUri, packages);
      if (targetName != null && targetName != package.name) {
        final _WorkspacePackage target = packages[targetName]!;
        for (final _ForbiddenEdge edge in forbiddenEdges) {
          if (_matchesPattern(package.category, edge.fromPattern, package.name) &&
              _matchesTargetPattern(target, edge.toPattern)) {
            errors.add(
              '${package.name} ($relativePath) imports package:$targetName/: ${edge.message}',
            );
          }
        }
      }

      for (final _ImportWarning warning in importWarnings) {
        if (_matchesPattern(package.category, warning.fromPattern, package.name) &&
            importUri.startsWith(warning.importPrefix)) {
          warnings.add('${package.name} ($relativePath): ${warning.message} [${warning.id}]');
        }
      }
    }
  }
}

void _checkPathWarnings({
  required _WorkspacePackage package,
  required List<_PathWarning> pathWarnings,
  required List<String> warnings,
}) {
  for (final _PathWarning rule in pathWarnings) {
    if (!_matchesPattern(package.category, rule.fromPattern, package.name)) {
      continue;
    }

    final Directory entitiesDir = Directory('${package.directory.path}/lib/src/entities');
    if (!entitiesDir.existsSync()) {
      continue;
    }

    for (final FileSystemEntity entity in entitiesDir.listSync(recursive: true)) {
      if (entity is! File || !entity.path.endsWith('.dart')) {
        continue;
      }

      final String fileName = entity.uri.pathSegments.last;
      for (final String pattern in rule.forbiddenNamePatterns) {
        if (fileName.contains(pattern)) {
          warnings.add('${package.name} ($fileName): ${rule.message} [${rule.id}]');
        }
      }
    }
  }
}

String? _extractPackageUri(String directive) {
  final RegExp match = RegExp(r'''^(?:import|export)\s+'([^']+)' ''');
  final RegExpMatch? result = match.firstMatch('$directive ');
  return result?.group(1);
}

String? _packageNameFromUri(String uri, Map<String, _WorkspacePackage> packages) {
  if (!uri.startsWith('package:')) {
    return null;
  }

  final String rest = uri.substring('package:'.length);
  final int slash = rest.indexOf('/');
  final String name = slash == -1 ? rest : rest.substring(0, slash);
  return packages.containsKey(name) ? name : null;
}

bool _matchesPattern(_PackageCategory category, String pattern, String packageName) {
  return switch (pattern) {
    'features/*' => category == _PackageCategory.feature,
    'shared_*' => category == _PackageCategory.shared,
    'infrastructure' => category == _PackageCategory.infrastructure,
    'domain' => packageName == 'domain',
    'data' => packageName == 'data',
    _ => packageName == pattern,
  };
}

bool _matchesTargetPattern(_WorkspacePackage target, String pattern) {
  return switch (pattern) {
    'features/*' => target.category == _PackageCategory.feature,
    'shared_*' => target.category == _PackageCategory.shared,
    _ => target.name == pattern,
  };
}

enum _PackageCategory {
  app,
  feature,
  shared,
  infrastructure,
  navigation,
  legacyGlobal,
  other,
}

final class _WorkspacePackage {
  const _WorkspacePackage({
    required this.name,
    required this.directory,
    required this.category,
    required this.dependencies,
  });

  final String name;
  final Directory directory;
  final _PackageCategory category;
  final Set<String> dependencies;
}

final class _ForbiddenEdge {
  const _ForbiddenEdge({required this.fromPattern, required this.toPattern, required this.message});

  final String fromPattern;
  final String toPattern;
  final String message;
}

final class _ImportWarning {
  const _ImportWarning({
    required this.id,
    required this.fromPattern,
    required this.importPrefix,
    required this.message,
  });

  final String id;
  final String fromPattern;
  final String importPrefix;
  final String message;

  @override
  String toString() => id;
}

final class _PathWarning {
  const _PathWarning({
    required this.id,
    required this.fromPattern,
    required this.pathGlob,
    required this.forbiddenNamePatterns,
    required this.message,
  });

  final String id;
  final String fromPattern;
  final String pathGlob;
  final List<String> forbiddenNamePatterns;
  final String message;
}
