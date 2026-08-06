import 'package:flutter/material.dart';
import 'package:shared_ui/src/theme/themes.dart';
import 'package:shared_ui/src/theme_type.dart';

// ignore_for_file: library_private_types_in_public_api

class DynamicTheme extends StatefulWidget {
  const DynamicTheme({required this.child, this.initialThemeKey, super.key});

  final Widget child;
  final ThemeType? initialThemeKey;

  static ThemeData? themeOf(BuildContext context) {
    final _DynamicThemeInherited? inherited = context
        .dependOnInheritedWidgetOfExactType<_DynamicThemeInherited>();
    return inherited?.data.theme;
  }

  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> with WidgetsBindingObserver {
  late ThemeData _theme;
  late ThemeType _themeType;
  late bool isThemeInitialized;

  ThemeData get theme => _theme;

  ThemeType get themeType => _themeType;

  bool get isRegularTheme => _themeType == ThemeType.regular;

  bool get isDarkTheme => _themeType == ThemeType.dark;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    isThemeInitialized = false;
    if (widget.initialThemeKey != null) {
      _themeType = widget.initialThemeKey!;
      _theme = ThemeBuilder.getTheme(widget.initialThemeKey!);
      isThemeInitialized = true;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (widget.initialThemeKey == null && !isThemeInitialized) {
      _applySystemTheme();
      isThemeInitialized = true;
    }
    super.didChangeDependencies();
  }

  @override
  void didChangePlatformBrightness() {
    if (widget.initialThemeKey != null) return;
    _applySystemTheme();
  }

  void changeTheme(ThemeType themeKey) {
    setState(() {
      _themeType = themeKey;
      _theme = ThemeBuilder.getTheme(themeKey);
    });
  }

  void _applySystemTheme() {
    final Brightness brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    final ThemeType next = brightness == Brightness.dark ? ThemeType.dark : ThemeType.regular;
    if (isThemeInitialized && next == _themeType) return;

    if (!isThemeInitialized) {
      _themeType = next;
      _theme = ThemeBuilder.getTheme(next);
      return;
    }

    setState(() {
      _themeType = next;
      _theme = ThemeBuilder.getTheme(next);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _DynamicThemeInherited(data: this, child: widget.child);
  }
}

class _DynamicThemeInherited extends InheritedWidget {
  const _DynamicThemeInherited({required this.data, required super.child});

  final _DynamicThemeState data;

  @override
  bool updateShouldNotify(_DynamicThemeInherited oldWidget) {
    return true;
  }
}
