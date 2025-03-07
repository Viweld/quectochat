import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quectochat/domain/environment/builders.dep_gen.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';
import 'package:quectochat/presentation/screens/chat_screen/chat_screen_arguments.dart';
import 'package:quectochat/presentation/screens/chat_screen/widgets/chat_screen_app_bar.dart';
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
  String? _interlocutorId;
  String? _firstName;
  String? _lastName;
  ChatBloc? _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments is! ChatScreenArguments) {
      throw UnsupportedError('Expected arguments of type ChatScreenArguments');
    }
    _interlocutorId = arguments.id;
    _firstName = arguments.firstName;
    _lastName = arguments.lastName;
    _bloc ??= context.depGen().buildChatBloc(interlocutorId: arguments.id);
  }

  @override
  void dispose() {
    unawaited(_bloc?.close());
    super.dispose();
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
        child: Scaffold(
          appBar: ChatScreenAppBar(
            firstName: _firstName ?? '',
            lastName: _lastName ?? '',
            status: 'status',
          ),
          body: Column(
            children: [
              /// Область просмотра сообщений
              const Expanded(child: ReadingView()),

              /// Область написания сообщений
              TypingView(interlocutorId: _interlocutorId!),
            ],
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
