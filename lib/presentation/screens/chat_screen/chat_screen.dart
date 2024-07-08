import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quectochat/domain/environment/builders.dep_gen.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';
import 'package:quectochat/presentation/common/common_accent_button.dart';
import 'package:quectochat/presentation/common/common_text_field.dart';

import '../../common/common_pending_indicator.dart';
import '../../common/common_toast.dart';
import '../../values/values.dart';
import 'bloc/chat_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => context.depGen().buildChatBloc(
              toId: ModalRoute.of(context)?.settings.arguments as String,
            ),
        child: BlocConsumer<ChatBloc, ChatState>(
          listenWhen: (_, state) => state.maybeMap(
            requestError: (_) => true,
            orElse: () => false,
          ),
          buildWhen: (_, state) => state.maybeMap(
            view: (_) => true,
            pending: (_) => true,
            orElse: () => false,
          ),
          listener: (context, state) => state.mapOrNull(
            requestError: (s) => _requestError(context, s.errorText),
          ),
          builder: (context, state) => state.maybeMap(
            orElse: () => throw UnimplementedError(
              'Wrong state for ChatScreen',
            ),
            pending: (s) => const Center(child: CommonPendingIndicator()),
            view: (s) => Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      /// Либо надпись об отсутствии переписок, либо список переписок
                      if (s.messages.isEmpty)
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Values.horizontalPadding,
                              ),
                              child: Text(
                                // TODO(Vadim): #localization
                                'Вы еще не начали переписку...',
                                textAlign: TextAlign.center,
                                style: context.style12w500$labels,
                              ),
                            ),
                          ),
                        )
                      else
                        SliverList.builder(
                          itemCount: s.messages.length,
                          itemBuilder: (context, i) {
                            return Text(s.messages.elementAt(i).content);
                          },
                        ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CommonEditField(
                        initialText: s.typedMessage,
                        onChanged: (val) => _onMessageChanged(context, val),
                      ),
                    ),
                    CommonAccentButton(
                      title: 'Send',
                      onTapped: () => _onSendTapped(
                        context,
                      ),
                    ),
                  ],
                ),
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
    context.read<ChatBloc>().add(ChatEvent.onMessageChanged(val));
  }

  void _onSendTapped(BuildContext context) {
    context.read<ChatBloc>().add(const ChatEvent.onSendTapped());
  }

  // КОЛЛБЭКИ от смены состояний:
  // ---------------------------------------------------------------------------
  void _requestError(BuildContext context, String? errorText) {
    CommonToast.showError(
      context,
      text: errorText ?? context.texts.commonRequestError,
    );
  }
}
