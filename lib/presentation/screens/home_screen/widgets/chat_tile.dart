part of '../home_screen.dart';

class _ChatTile extends StatelessWidget {
  const _ChatTile({
    required this.interlocutor,
    required this.onTapped,
    required this.onClearChatRequested,
  });

  final Interlocutor interlocutor;
  final void Function() onTapped;
  final void Function() onClearChatRequested;

  static const double _horizontalInterval = 12;
  static const double _verticalContentPadding = 10;

  @override
  Widget build(BuildContext context) {
    return SwipeClearWrapper(
      onClearChatRequested: onClearChatRequested,
      child: Material(
        child: InkWell(
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
                        key: UniqueKey(),
                        firstName: interlocutor.firstName,
                        lastName: interlocutor.lastName,
                      ),
                      const SizedBox(width: _horizontalInterval),

                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Полное имя собеседника
                            Text(
                              '${interlocutor.firstName} ${interlocutor.lastName}',
                              style: context.style15w600$username,
                            ),

                            /// Последнее сообщение в чате
                            if (interlocutor.lastSentContent != null)
                              Row(
                                children: [
                                  if (interlocutor.isSentByYou ?? false)
                                    Text(
                                      context.texts.homeChatTileYouLabel,
                                      style:
                                          context.style12w500$labels?.copyWith(
                                        color: context.palette.black,
                                      ),
                                    ),
                                  Expanded(
                                    child: Text(
                                      interlocutor.lastSentContent ?? '',
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
                if (interlocutor.lastSentAt != null)
                  Text(
                    timeAgoSinceDate(context, interlocutor.lastSentAt!),
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
