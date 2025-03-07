import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quectochat/domain/environment/builders.dep_gen.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';
import 'package:quectochat/presentation/common/common_text_field.dart';
import 'package:quectochat/presentation/screens/chat_screen/widgets/typing_view/widgets/attach_file_button.dart';

import 'bloc/typing_view_bloc.dart';
import 'widgets/send_message_button.dart';

/// ОБЛАСТЬ ВВОДА СООБЩЕНИЙ
class TypingView extends StatelessWidget {
  const TypingView({
    required this.interlocutorId,
    super.key,
  });

  final String interlocutorId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.depGen().buildTypingViewBloc(
            interlocutorId: interlocutorId,
          ),
      child: BlocBuilder<TypingViewBloc, TypingViewState>(
        buildWhen: (_, state) => state.maybeMap(
          view: (_) => true,
          orElse: () => false,
        ),
        builder: (context, state) => state.maybeMap(
          orElse: () => throw UnimplementedError(
            'Wrong state for TypingView',
          ),
          view: (s) => DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: context.palette.stroke,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              child: Row(
                children: [
                  AttachFileButton(onTapped: () => _onAttachTapped(context)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CommonEditField(
                      initialText: s.typedMessage,
                      onChanged: (val) => _onMessageChanged(context, val),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SendMessageButton(onTapped: () => _onSendTapped(context)),
                ],
              ),
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
