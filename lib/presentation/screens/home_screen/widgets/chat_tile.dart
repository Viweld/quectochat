part of '../home_screen.dart';

class _ChatTile extends StatelessWidget {
  const _ChatTile({
    required this.chatListItem,
    required this.onTapped,
  });

  final ChatListItem chatListItem;
  final void Function() onTapped;

  static const double _initialsPlateSize = 50;
  static const double _horizontalInterval = 12;
  static const double _verticalContentPadding = 10;

  @override
  Widget build(BuildContext context) {
    final color = ColorUtils.stringToColor(
      chatListItem.firstName + chatListItem.lastName,
    );

    return InkWell(
      overlayColor: MaterialStateProperty.all(context.palette.green),
      onTap: onTapped,
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
                  SizedBox.square(
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
                                colors: [color.withOpacity(0.8), color],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          chatListItem.initials,
                          style: context.style20w700$initials,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: _horizontalInterval),

                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                  const SizedBox(width: _horizontalInterval),
                ],
              ),
            ),

            /// Интервал с момента отправки последнего сообщения
            Text(
              timeAgoSinceDate(date: chatListItem.lastMessageSentAt),
              style: context.style12w500$labels,
            ),
            const SizedBox(width: _horizontalInterval),
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
