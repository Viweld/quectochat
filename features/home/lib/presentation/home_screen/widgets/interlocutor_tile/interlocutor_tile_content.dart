import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home/presentation/home_screen/widgets/interlocutor_tile/widgets/interlocutor_tile_message_preview.dart';
import 'package:home/presentation/home_screen/widgets/interlocutor_tile/widgets/interlocutor_tile_sent_at_label.dart';
import 'package:intl/intl.dart';
import 'package:shared_domain/shared_domain.dart';
import 'package:shared_ui/core_ui.dart';

/// Avatar, name, last-message preview and relative time for a home contact tile.
class InterlocutorTileContent extends StatefulWidget {
  const InterlocutorTileContent({super.key, required this.interlocutor});

  final Interlocutor interlocutor;

  @override
  State<InterlocutorTileContent> createState() => _InterlocutorTileContentState();
}

class _InterlocutorTileContentState extends State<InterlocutorTileContent> {
  static const double _gap = 12;
  static const int _refreshIntervalSeconds = 60;

  Timer? _timer;
  String _sentAtLabel = '';

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _refreshSentAtLabel();
  }

  @override
  void didUpdateWidget(covariant InterlocutorTileContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.interlocutor.lastSentAt != oldWidget.interlocutor.lastSentAt) {
      _refreshSentAtLabel();
      _stopTimer();
      _startTimer();
    }
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Interlocutor interlocutor = widget.interlocutor;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              AppUserAvatar(displayName: interlocutor.displayName),
              const SizedBox(width: _gap),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      interlocutor.displayName,
                      style: context.username.copyWith(color: context.colors.text.strong),
                    ),
                    if (interlocutor.lastSentContent != null)
                      InterlocutorTileMessagePreview(interlocutor: interlocutor),
                  ],
                ),
              ),
              const SizedBox(width: _gap),
            ],
          ),
        ),
        InterlocutorTileSentAtLabel(label: _sentAtLabel),
        const SizedBox(width: _gap),
      ],
    );
  }

  void _startTimer() {
    if (widget.interlocutor.lastSentAt == null) return;
    _timer = Timer.periodic(const Duration(seconds: _refreshIntervalSeconds), (_) {
      if (mounted) _refreshSentAtLabel();
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _refreshSentAtLabel() {
    final DateTime? sentAt = widget.interlocutor.lastSentAt;
    final String nextLabel = sentAt == null ? '' : _formatRelativeTime(context, sentAt);
    if (nextLabel == _sentAtLabel) return;
    setState(() => _sentAtLabel = nextLabel);
  }

  String _formatRelativeTime(BuildContext context, DateTime date) {
    final DateTime localSentAt = date.toLocal();
    final Duration difference = DateTime.now().toLocal().difference(localSentAt);

    if (difference.inSeconds <= 60) {
      return context.texts.timeAgoJustNow;
    }
    if (difference.inMinutes <= 10) {
      return context.texts.timeAgoSeveralMinutes(difference.inMinutes);
    }
    if (difference.inHours <= 24) {
      return DateFormat('hh:mm').format(localSentAt);
    }
    if (difference.inHours <= 48) {
      return context.texts.timeAgoYesterday;
    }
    return DateFormat('dd.MM.yy').format(localSentAt);
  }
}
