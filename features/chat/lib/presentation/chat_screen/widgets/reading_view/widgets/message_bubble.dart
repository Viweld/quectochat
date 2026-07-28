import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/core_ui.dart';

import 'package:chat/domain/entities/message.dart';
import 'cluster_attribute.dart';
import 'left_message.dart';
import 'right_message.dart';

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
            backgroundColor: context.palette.green,
          )
        : LeftMessage(
            message: message,
            clusterAttribute: clusterAttribute,
            backgroundColor: context.palette.gray,
          );
  }
}
