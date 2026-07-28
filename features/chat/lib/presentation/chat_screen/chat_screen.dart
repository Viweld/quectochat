import 'package:flutter/material.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

import 'bloc/chat_bloc.dart';
import 'chat_content.dart';

@RoutePage()
class ChatScreen extends StatelessWidget {
  const ChatScreen({
    required this.interlocutorId,
    required this.firstName,
    required this.lastName,
    super.key,
  });

  final String interlocutorId;
  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => appLocator<ChatBloc>(param1: interlocutorId),
      child: BlocConsumer<ChatBloc, ChatState>(
        listenWhen: (ChatState previous, ChatState current) => previous.effect != current.effect,
        listener: (BuildContext context, ChatState state) {
          final ChatEffect? effect = state.effect;
          if (effect == null) return;

          effect.when(
            showError: (AppErrorKind kind, String? transitMessage) => CommonToast.showError(
              context,
              text: transitMessage ?? context.texts.commonRequestError,
            ),
          );

          context.read<ChatBloc>().add(const ChatEvent.effectHandled());
        },
        builder: (BuildContext context, ChatState state) =>
            ChatContent(interlocutorId: interlocutorId, firstName: firstName, lastName: lastName),
      ),
    );
  }
}
