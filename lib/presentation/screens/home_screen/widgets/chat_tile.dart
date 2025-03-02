part of '../home_screen.dart';

class _ChatTile extends StatelessWidget {
  const _ChatTile({
    required this.chatListItem,
    required this.onTapped,
  });

  final ChatListItem chatListItem;
  final void Function() onTapped;

  static const double _horizontalInterval = 12;
  static const double _verticalContentPadding = 10;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStateProperty.all(context.palette.green),
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
                  CommonUserAvatar(
                    firstName: chatListItem.firstName,
                    lastName: chatListItem.lastName,
                  ),
                  const SizedBox(width: _horizontalInterval),

                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Полное имя собеседника
                        // TODO(Vadim): #idea сделать выделение фрагмента, совпавшего с поисковым запросом
                        Text(
                          '${chatListItem.firstName} ${chatListItem.lastName}',
                          style: context.style15w600$username,
                        ),

                        /// Последнее сообщение в чате
                        Row(
                          children: [
                            if (chatListItem.isSentByYou)
                              Text(
                                context.texts.homeChatTileYouLabel,
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
              timeAgoSinceDate(context, chatListItem.lastMessageSentAt),
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
