import 'package:flutter/material.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';
import 'package:string_to_color/string_to_color.dart';

class CommonUserAvatar extends StatefulWidget {
  const CommonUserAvatar({
    required this.firstName,
    required this.lastName,
    this.dimension = defaultDimension,
    super.key,
  });

  final String firstName;
  final String lastName;
  final double dimension;

  static const double defaultDimension = 50;

  @override
  State<CommonUserAvatar> createState() => _CommonUserAvatarState();
}

class _CommonUserAvatarState extends State<CommonUserAvatar> {
  late final Color color;

  @override
  void initState() {
    color = ColorUtils.stringToColor(widget.firstName + widget.lastName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: widget.dimension,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.dimension * 0.5),
                ),
                gradient: LinearGradient(
                  colors: [color.withValues(alpha: 0.8), color],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Text(
            _getInitials(widget.firstName, widget.lastName),
            style: context.style20w700$initials,
          ),
        ],
      ),
    );
  }

  /// Возвращает инициалы пользователя
  String _getInitials(String fn, String ln) {
    return (fn.substring(0, 1) + ln.substring(0, 1)).toUpperCase();
  }
}
