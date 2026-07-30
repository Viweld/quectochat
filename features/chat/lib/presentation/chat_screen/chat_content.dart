import 'package:chat/domain/entities/interlocutor_status.dart';
import 'package:chat/presentation/chat_screen/widgets/chat_screen_app_bar.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/reading_view.dart';
import 'package:chat/presentation/chat_screen/widgets/typing_view/typing_view.dart';
import 'package:flutter/material.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

class ChatContent extends StatelessWidget {
  const ChatContent({
    super.key,
    required this.interlocutorId,
    required this.firstName,
    required this.lastName,
    required this.interlocutorStatus,
  });

  final String interlocutorId;
  final String firstName;
  final String lastName;
  final InterlocutorStatus? interlocutorStatus;

  @override
  Widget build(BuildContext context) {
    final AppNavigator navigator = appLocator<AppNavigator>();

    return Scaffold(
      appBar: ChatScreenAppBar(
        firstName: firstName,
        lastName: lastName,
        status: _resolveStatusText(context, interlocutorStatus),
        statusColor: interlocutorStatus == InterlocutorStatus.typing
            ? context.palette.greenDark
            : null,
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

  String _resolveStatusText(BuildContext context, InterlocutorStatus? status) {
    if (status == null) return '';
    return switch (status) {
      InterlocutorStatus.typing => context.texts.chatStatusTyping,
      InterlocutorStatus.online => context.texts.chatStatusOnline,
      InterlocutorStatus.recentlyOffline => context.texts.chatStatusRecentlyOffline,
      InterlocutorStatus.longOffline => context.texts.chatStatusLongOffline,
    };
  }
}
