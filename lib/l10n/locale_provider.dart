import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocaleProvider extends StatefulWidget {
  const LocaleProvider({
    required this.child,
    super.key,
  });

  static _LocaleProviderState? of(BuildContext context) {
    final _LocaleProviderInherited? inherited =
        context.dependOnInheritedWidgetOfExactType<_LocaleProviderInherited>();
    return inherited?.data;
  }

  static const List<Locale> supportedLocales =
      AppLocalizations.supportedLocales;

  final Widget child;

  @override
  _LocaleProviderState createState() => _LocaleProviderState();
}

// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
class _LocaleProviderState extends State<LocaleProvider> {
  Locale? _locale;

  Locale? get locale => _locale;

  // ---------------------------------------------------------------------------
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  // ---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return _LocaleProviderInherited(
      data: this,
      child: widget.child,
    );
  }
}

// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
class _LocaleProviderInherited extends InheritedWidget {
  const _LocaleProviderInherited({
    required this.data,
    required super.child,
  });

  final _LocaleProviderState data;

  @override
  bool updateShouldNotify(_LocaleProviderInherited oldWidget) {
    return true;
  }
}
