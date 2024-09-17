import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quectochat/domain/environment/builders.dep_gen.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';
import 'package:quectochat/presentation/screens/chat_screen/widgets/typing_view/typing_view.dart';

import '../../common/common_toast.dart';
import 'bloc/chat_bloc.dart';
import 'widgets/reading_view/reading_view.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatBloc? _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments is! String) {
      throw UnsupportedError('Expected arguments of type String');
    }
    _bloc ??= context.depGen().buildChatBloc(partnerId: arguments);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc!,
      child: BlocListener<ChatBloc, ChatState>(
        listenWhen: (_, state) => state.maybeMap(
          requestError: (_) => true,
          orElse: () => false,
        ),
        listener: (context, state) => state.mapOrNull(
          requestError: (s) => _requestError(context, s.errorText),
        ),
        child: const Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                /// Область просмотра сообщений
                Expanded(child: ReadingView()),

                /// Область написания сообщений
                TypingView(),
              ],
            ),
          ),
        ),
      ),
    );
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
