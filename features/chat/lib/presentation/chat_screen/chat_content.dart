import 'package:chat/presentation/chat_screen/widgets/chat_screen_app_bar.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/reading_view.dart';
import 'package:chat/presentation/chat_screen/widgets/typing_view/typing_view.dart';
import 'package:flutter/material.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';

class ChatContent extends StatelessWidget {
  const ChatContent({
    super.key,
    required this.interlocutorId,
    required this.firstName,
    required this.lastName,
  });

  final String interlocutorId;
  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {
    final AppNavigator navigator = appLocator<AppNavigator>();

    return Scaffold(
      appBar: ChatScreenAppBar(
        firstName: firstName,
        lastName: lastName,
        status: 'status',
        onBackPressed: navigator.navigateBack,
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: ReadingView(interlocutorId: interlocutorId)),
          TypingView(interlocutorId: interlocutorId),
        ],
      ),
    );
  }
}
