import 'package:chat/domain/entities/message.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/widgets/cluster_attribute.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/widgets/left_message.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/widgets/right_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({required this.message, required this.clusterAttribute, super.key});

  final Message message;
  final ClusterAttribute? clusterAttribute;

  @override
  Widget build(BuildContext context) {
    return message.isOwn
        ? RightMessage(
            message: message,
            clusterAttribute: clusterAttribute,
            backgroundColor: context.colors.chat.bubbleOwn,
          )
        : LeftMessage(
            message: message,
            clusterAttribute: clusterAttribute,
            backgroundColor: context.colors.chat.bubblePeer,
          );
  }
}
