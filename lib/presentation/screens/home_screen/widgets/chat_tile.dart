part of '../home_screen.dart';

class _ChatTile extends StatefulWidget {
  const _ChatTile({
    required this.interlocutor,
    required this.onTapped,
    required this.onClearChatRequested,
  });

  final Interlocutor interlocutor;
  final void Function() onTapped;
  final void Function() onClearChatRequested;

  @override
  State<_ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<_ChatTile> {
  static const double _horizontalInterval = 12;
  static const double _verticalContentPadding = 10;
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
  void didUpdateWidget(covariant _ChatTile oldWidget) {
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
        (timer) => mounted ? _updateTimeAgo() : null,
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
        _timeAgo = timeAgoSinceDate(context, widget.interlocutor.lastSentAt!);
      });
    } else {
      setState(() {
        _timeAgo = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SwipeClearWrapper(
      onClearChatRequested: widget.onClearChatRequested,
      child: Material(
        child: InkWell(
          overlayColor: WidgetStateProperty.all(context.palette.green),
          onTap: widget.onTapped,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: _verticalContentPadding,
              horizontal: Values.horizontalPadding,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// Бирка с инициалами
                      CommonUserAvatar(
                        key: UniqueKey(),
                        firstName: widget.interlocutor.firstName,
                        lastName: widget.interlocutor.lastName,
                      ),
                      const SizedBox(width: _horizontalInterval),

                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Полное имя собеседника
                            Text(
                              '${widget.interlocutor.firstName} ${widget.interlocutor.lastName}',
                              style: context.style15w600$username,
                            ),

                            /// Последнее сообщение в чате
                            if (widget.interlocutor.lastSentContent != null)
                              Row(
                                children: [
                                  if (widget.interlocutor.isSentByYou ?? false)
                                    Text(
                                      context.texts.homeChatTileYouLabel,
                                      style:
                                          context.style12w500$labels?.copyWith(
                                        color: context.palette.black,
                                      ),
                                    ),
                                  Expanded(
                                    child: Text(
                                      widget.interlocutor.lastSentContent ?? '',
                                      style: context.style12w500$labels,
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

                /// Интервал с момента отправки последнего сообщения
                Text(
                  _timeAgo,
                  style: context.style12w500$labels,
                ),
                const SizedBox(width: _horizontalInterval),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ:
  // ---------------------------------------------------------------------------
  /// Генерирует текст надписи об интервале времени,
  /// прошедшего с момента публикации последнего сообщения
  String timeAgoSinceDate(BuildContext context, DateTime date) {
    final date1 = date.toLocal();
    final date2 = DateTime.now().toLocal();
    final difference = date2.difference(date1);

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
