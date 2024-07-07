import 'package:flutter/material.dart';

import '../../domain/models/theme_type.dart';
import '../values/palette.dart';
import 'themes.dart';

// ignore_for_file: library_private_types_in_public_api
// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
class DynamicTheme extends StatefulWidget {
  const DynamicTheme({
    required this.child,
    this.initialThemeKey,
    super.key,
  });

  final Widget child;
  final ThemeType? initialThemeKey;

  // ---------------------------------------------------------------------------
  static ThemeData? themeOf(BuildContext context) {
    final _DynamicThemeInherited? inherited =
        context.dependOnInheritedWidgetOfExactType<_DynamicThemeInherited>();
    return inherited?.data.theme;
  }

  // ---------------------------------------------------------------------------
  static Palette paletteOf(BuildContext context) {
    final _DynamicThemeInherited? inherited =
        context.dependOnInheritedWidgetOfExactType<_DynamicThemeInherited>();
    return inherited?.data.palette ?? Palette.regular();
  }

  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
class _DynamicThemeState extends State<DynamicTheme> {
  late ThemeData _theme;
  late Palette _palette;
  late ThemeType _themeType;
  late bool isThemeInitialized;

  ThemeData get theme => _theme;
  Palette get palette => _palette;
  ThemeType get themeType => _themeType;

  bool get isRegularTheme => _themeType == ThemeType.regular;

  // ---------------------------------------------------------------------------
  @override
  void initState() {
    isThemeInitialized = false;
    if (widget.initialThemeKey != null) {
      _themeType = widget.initialThemeKey!;
      _palette = ThemeBuilder.getPalette(widget.initialThemeKey!);
      _theme = ThemeBuilder.getTheme(widget.initialThemeKey!, _palette);
    }
    super.initState();
  }

  // ---------------------------------------------------------------------------
  @override
  void didChangeDependencies() {
    if (widget.initialThemeKey == null && !isThemeInitialized) {
      _themeType = ThemeType.regular;
      _palette = ThemeBuilder.getPalette(_themeType);
      _theme = ThemeBuilder.getTheme(_themeType, _palette);
      isThemeInitialized = true;
    }
    super.didChangeDependencies();
  }

  // ---------------------------------------------------------------------------
  void changeTheme(ThemeType themeKey) {
    setState(() {
      _themeType = themeKey;
      _palette = ThemeBuilder.getPalette(themeKey);
      _theme = ThemeBuilder.getTheme(themeKey, _palette);
    });
  }

  // ---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return _DynamicThemeInherited(
      data: this,
      child: widget.child,
    );
  }
}

// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
class _DynamicThemeInherited extends InheritedWidget {
  const _DynamicThemeInherited({
    required this.data,
    required super.child,
  });

  final _DynamicThemeState data;

  @override
  bool updateShouldNotify(_DynamicThemeInherited oldWidget) {
    return true;
  }
}
