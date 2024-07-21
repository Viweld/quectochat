import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quectochat/domain/environment/builders.dep_gen.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';
import 'package:quectochat/presentation/common/common_text_field.dart';

import '../../common/common_pending_indicator.dart';
import '../../common/common_toast.dart';
import '../../values/values.dart';
import 'bloc/chat_bloc.dart';
import 'widgets/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatBloc? _bloc;

  @override
  void didChangeDependencies() {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments is! String) {
      throw UnsupportedError('Expected arguments of type String');
    }
    _bloc ??= context.depGen().buildChatBloc(toId: arguments);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('Проверка алиаса в повершелл');
    return Scaffold(
      body: BlocProvider.value(
        value: _bloc!,
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
            view: (s) => SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomScrollView(
                        reverse: true,
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
                          else ...[
                            const SliverToBoxAdapter(
                              child: SizedBox(height: 20),
                            ),
                            SliverList.separated(
                              itemCount: s.messages.length,
                              itemBuilder: (context, i) {
                                final message =
                                    s.messages.toList().reversed.elementAt(i);
                                return MessageBubble(
                                  text: message.content,
                                  createdAt: message.createdAt,
                                );
                              },
                              separatorBuilder: (context, i) =>
                                  const SizedBox(height: 10),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: Values.dividerThickness,
                    color: context.palette.gray,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 20,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: CommonEditField(
                            initialText: s.typedMessage,
                            onChanged: (val) => _onMessageChanged(context, val),
                          ),
                        ),
                        const SizedBox(width: 8),
                        _SendButton(onTapped: () => _onSendTapped(context)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // КОЛЛБЭКИ от действий пользователя:
  void _onMessageChanged(BuildContext context, String val) {
    context.read<ChatBloc>().add(ChatEvent.onMessageChanged(val));
  }

  void _onSendTapped(BuildContext context) {
    context.read<ChatBloc>().add(const ChatEvent.onSendTapped());
  }

  // КОЛЛБЭКИ от смены состояний:
  void _requestError(BuildContext context, String? errorText) {
    CommonToast.showError(
      context,
      text: errorText ?? context.texts.commonRequestError,
    );
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
class _SendButton extends StatelessWidget {
  const _SendButton({
    required this.onTapped,
  });

  final void Function() onTapped;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTapped,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size(42, 42)),
        padding: MaterialStateProperty.all(
          EdgeInsets.zero,
        ),
        backgroundColor: MaterialStateProperty.all(
          context.palette.stroke,
        ),
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                Values.textFieldBorderRadius,
              ),
            ),
          ),
        ),
      ),
      child: Icon(
        Icons.send,
        color: context.palette.black,
      ),
    );
  }
}
