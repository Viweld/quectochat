import 'package:chat/presentation/chat_screen/bloc/chat_bloc.dart';
import 'package:chat/presentation/chat_screen/chat_content.dart';
import 'package:chat/presentation/chat_screen/widgets/chat_active_presence_lifecycle.dart';
import 'package:flutter/material.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

@RoutePage()
class ChatScreen extends StatelessWidget {
  const ChatScreen({required this.interlocutorId, required this.displayName, super.key});

  final String interlocutorId;
  final String displayName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatBloc>(
      create: (BuildContext context) => appLocator<ChatBloc>(param1: interlocutorId),
      child: ChatActivePresenceLifecycle(
        child: BlocConsumer<ChatBloc, ChatState>(
          listenWhen: (ChatState previous, ChatState current) => previous.effect != current.effect,
          listener: (BuildContext context, ChatState state) {
            final ChatEffect? effect = state.effect;
            if (effect == null) return;

            effect.when(
              showError: (AppErrorKind kind, String? transitMessage) => CommonToast.showError(
                context,
                text: transitMessage ?? _resolveErrorText(context, kind),
              ),
            );

            context.read<ChatBloc>().add(const ChatEvent.effectHandled());
          },
          builder: (BuildContext context, ChatState state) => ChatContent(
            interlocutorId: interlocutorId,
            displayName: displayName,
            interlocutorStatus: state.interlocutorStatus,
          ),
        ),
      ),
    );
  }

  String _resolveErrorText(BuildContext context, AppErrorKind kind) {
    return switch (kind) {
      AppErrorKind.network => context.texts.toastNetworkError,
      AppErrorKind.server => context.texts.toastServerError,
      _ => context.texts.commonRequestError,
    };
  }
}
