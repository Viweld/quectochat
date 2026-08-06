import 'package:chat/domain/entities/interlocutor_status.dart';
import 'package:chat/presentation/chat_screen/bloc/chat_bloc.dart';
import 'package:chat/presentation/chat_screen/widgets/chat_clear_chat_confirm_dialog.dart';
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
    required this.displayName,
    required this.interlocutorStatus,
  });

  final String interlocutorId;
  final String displayName;
  final InterlocutorStatus? interlocutorStatus;

  @override
  Widget build(BuildContext context) {
    final AppNavigator navigator = appLocator<AppNavigator>();

    return Scaffold(
      appBar: ChatScreenAppBar(
        displayName: displayName,
        status: _resolveStatusText(context, interlocutorStatus),
        statusColor: interlocutorStatus == InterlocutorStatus.typing
            ? context.colors.text.onAccent
            : null,
        onBackPressed: navigator.navigateBack,
        onClearChatPressed: () async {
          final bool confirmed = await ChatClearChatConfirmDialog.show(context);
          if (!confirmed || !context.mounted) return;
          context.read<ChatBloc>().add(const ChatEvent.onClearChatRequested());
        },
      ),
      // Keep composer above the system nav bar (Android 15+ edge-to-edge).
      body: SafeArea(
        top: false,
        child: Column(
          children: <Widget>[
            Expanded(child: ReadingView(interlocutorId: interlocutorId)),
            TypingView(interlocutorId: interlocutorId),
          ],
        ),
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
