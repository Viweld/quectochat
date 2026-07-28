import 'package:flutter/material.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';
import 'widgets/attach_file_button.dart';

import 'bloc/typing_view_bloc.dart';
import 'widgets/send_message_button.dart';

/// ОБЛАСТЬ ВВОДА СООБЩЕНИЙ
class TypingView extends StatelessWidget {
  const TypingView({required this.interlocutorId, super.key});

  final String interlocutorId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appLocator<TypingViewBloc>(param1: interlocutorId),
      child: BlocBuilder<TypingViewBloc, TypingViewState>(
        builder: (BuildContext context, TypingViewState state) => DecoratedBox(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: context.palette.stroke)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            child: Row(
              children: [
                AttachFileButton(onTapped: () => _onAttachTapped(context)),
                const SizedBox(width: 8),
                Expanded(
                  child: CommonEditField(
                    initialText: state.typedMessage,
                    onChanged: (String val) => _onMessageChanged(context, val),
                  ),
                ),
                const SizedBox(width: 8),
                SendMessageButton(onTapped: () => _onSendTapped(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // КОЛЛБЭКИ от действий пользователя:
  // ---------------------------------------------------------------------------
  void _onMessageChanged(BuildContext context, String val) {
    context.read<TypingViewBloc>().add(TypingViewEvent.onMessageChanged(val));
  }

  void _onSendTapped(BuildContext context) {
    context.read<TypingViewBloc>().add(const TypingViewEvent.onSendTapped());
  }

  void _onAttachTapped(BuildContext context) {
    // TODO(Vadim): #unimplemented
  }
}
