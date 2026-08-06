import 'package:flutter/material.dart';
import 'package:shared_domain/shared_domain.dart';
import 'package:shared_ui/core_ui.dart';

/// One-line last-message preview under the contact name.
class InterlocutorTileMessagePreview extends StatelessWidget {
  const InterlocutorTileMessagePreview({super.key, required this.interlocutor});

  final Interlocutor interlocutor;

  @override
  Widget build(BuildContext context) {
    final String previewText = interlocutor.lastSentContentType == MessageContentType.image
        ? context.texts.chatPhotoPlaceholder
        : (interlocutor.lastSentContent ?? '');

    return Row(
      children: <Widget>[
        if (interlocutor.isSentByYou ?? false)
          Text(
            context.texts.homeChatTileYouLabel,
            style: context.caption?.copyWith(color: context.colors.text.main),
          ),
        Expanded(
          child: Text(
            previewText,
            style: context.caption,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
