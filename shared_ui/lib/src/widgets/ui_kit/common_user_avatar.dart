import 'package:flutter/material.dart';
import 'package:shared_ui/src/extensions/context_extensions.dart';
import 'package:string_to_color/string_to_color.dart';

class CommonUserAvatar extends StatefulWidget {
  const CommonUserAvatar({required this.displayName, this.dimension = defaultDimension, super.key});

  final String displayName;
  final double dimension;

  static const double defaultDimension = 50;

  @override
  State<CommonUserAvatar> createState() => _CommonUserAvatarState();
}

class _CommonUserAvatarState extends State<CommonUserAvatar> {
  late final Color color;

  @override
  void initState() {
    color = ColorUtils.stringToColor(widget.displayName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: widget.dimension,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(widget.dimension * 0.5)),
                gradient: LinearGradient(
                  colors: <Color>[color.withValues(alpha: 0.8), color],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Text(_getInitials(widget.displayName), style: context.initials),
        ],
      ),
    );
  }

  /// Первые 1–2 символа [displayName] (после trim) в верхнем регистре.
  String _getInitials(String displayName) {
    final String trimmed = displayName.trim();
    if (trimmed.isEmpty) return '';
    final int end = trimmed.length >= 2 ? 2 : 1;
    return trimmed.substring(0, end).toUpperCase();
  }
}
