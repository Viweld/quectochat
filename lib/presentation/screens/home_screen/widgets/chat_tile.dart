part of '../home_screen.dart';

class _ChatTile extends StatelessWidget {
  const _ChatTile({
    required this.chatListItem,
    required this.onTapped,
  });

  final ChatListItem chatListItem;
  final void Function() onTapped;

  static const double _horizontalInterval = 12;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(context.palette.green),
      onTap: onTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Бирка с инициалами
            _InitialsPlate(initials: chatListItem.initials),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: _horizontalInterval,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Полное имя собеседника
                    Text(
                      '${chatListItem.firstName} ${chatListItem.lastName}',
                      style: context.style15w600$username,
                    ),

                    /// Последнее сообщение в чате
                    Row(
                      children: [
                        if (chatListItem.isSentByYou)
                          Text(
                            'Вы: ',
                            style: context.style12w500$labels?.copyWith(
                              color: context.palette.black,
                            ),
                          ),
                        Expanded(
                          child: Text(
                            chatListItem.lastMessageText,
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
            ),

            /// Интервал с момента отправки последнего сообщения
            Text(
              timeAgoSinceDate(date: chatListItem.lastMessageSentAt),
              style: context.style12w500$labels,
            ),
          ],
        ),
      ),
    );
  }

  // ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ:
  // ---------------------------------------------------------------------------
  /// Генерирует текст надписи об интервале времени,
  /// прошедшего с момента публикации последнего сообщения
  String timeAgoSinceDate({
    required DateTime date,
    bool numericDates = true,
  }) {
    final date1 = date.toLocal();
    final date2 = DateTime.now().toLocal();
    final difference = date2.difference(date1);

    if (difference.inSeconds < 5) {
      return 'Just now';
    } else if (difference.inSeconds <= 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes <= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inMinutes <= 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours <= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inHours <= 60) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays <= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inDays <= 6) {
      return '${difference.inDays} days ago';
    } else if ((difference.inDays / 7).ceil() <= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if ((difference.inDays / 7).ceil() <= 4) {
      return '${(difference.inDays / 7).ceil()} weeks ago';
    } else if ((difference.inDays / 30).ceil() <= 1) {
      return (numericDates) ? '1 month ago' : 'Last month';
    } else if ((difference.inDays / 30).ceil() <= 30) {
      return '${(difference.inDays / 30).ceil()} months ago';
    } else if ((difference.inDays / 365).ceil() <= 1) {
      return (numericDates) ? '1 year ago' : 'Last year';
    }
    return '${(difference.inDays / 365).floor()} years ago';
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
/// Круглая бляшка с инициалами
class _InitialsPlate extends StatelessWidget {
  const _InitialsPlate({
    required this.initials,
  });

  final String initials;

  static const double _initialsPlateSize = 50;

  @override
  Widget build(BuildContext context) {
    Color color = ColorUtils.stringToColor("name");

    return SizedBox.square(
      dimension: _initialsPlateSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(_initialsPlateSize * 0.5),
                ),
                gradient: LinearGradient(
                  colors: [color, color.withOpacity(0.5)],
                ),
              ),
            ),
          ),
          Text(initials, style: context.style20w700$initials),
        ],
      ),
    );
  }
}
