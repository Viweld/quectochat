import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_domain/shared_domain.dart';
import 'package:shared_ui/core_ui.dart';

/// Shared avatar / name / last-message / time row for home contact tiles.
class InterlocutorTileContent extends StatefulWidget {
  const InterlocutorTileContent({super.key, required this.interlocutor});

  final Interlocutor interlocutor;

  @override
  State<InterlocutorTileContent> createState() => _InterlocutorTileContentState();
}

class _InterlocutorTileContentState extends State<InterlocutorTileContent> {
  static const double _horizontalInterval = 12;
  static const int _updateDurationSec = 60;
  Timer? _timer;
  String _timeAgo = '';

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateTimeAgo();
  }

  @override
  void didUpdateWidget(covariant InterlocutorTileContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.interlocutor.lastSentAt != oldWidget.interlocutor.lastSentAt) {
      _updateTimeAgo();
      _stopTimer();
      _startTimer();
    }
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    if (widget.interlocutor.lastSentAt != null) {
      _timer = Timer.periodic(
        const Duration(seconds: _updateDurationSec),
        (Timer timer) => mounted ? _updateTimeAgo() : null,
      );
    }
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _updateTimeAgo() {
    if (widget.interlocutor.lastSentAt != null) {
      setState(() {
        _timeAgo = _timeAgoSinceDate(context, widget.interlocutor.lastSentAt!);
      });
    } else {
      setState(() {
        _timeAgo = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              CommonUserAvatar(key: UniqueKey(), displayName: widget.interlocutor.displayName),
              const SizedBox(width: _horizontalInterval),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.interlocutor.displayName, style: context.username),
                    if (widget.interlocutor.lastSentContent != null)
                      Row(
                        children: <Widget>[
                          if (widget.interlocutor.isSentByYou ?? false)
                            Text(
                              context.texts.homeChatTileYouLabel,
                              style: context.caption?.copyWith(color: context.colors.text.main),
                            ),
                          Expanded(
                            child: Text(
                              widget.interlocutor.lastSentContentType == MessageContentType.image
                                  ? context.texts.chatPhotoPlaceholder
                                  : (widget.interlocutor.lastSentContent ?? ''),
                              style: context.caption,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              const SizedBox(width: _horizontalInterval),
            ],
          ),
        ),
        Text(_timeAgo, style: context.caption),
        const SizedBox(width: _horizontalInterval),
      ],
    );
  }

  String _timeAgoSinceDate(BuildContext context, DateTime date) {
    final DateTime date1 = date.toLocal();
    final DateTime date2 = DateTime.now().toLocal();
    final Duration difference = date2.difference(date1);

    if (difference.inSeconds <= 60) {
      return context.texts.timeAgoJustNow;
    } else if (difference.inMinutes <= 10) {
      return context.texts.timeAgoSeveralMinutes(difference.inMinutes);
    } else if (difference.inHours <= 24) {
      return DateFormat('hh:mm').format(date1);
    } else if (difference.inHours <= 48) {
      return context.texts.timeAgoYesterday;
    } else {
      return DateFormat('dd.MM.yy').format(date1);
    }
  }
}
