import 'package:flutter/material.dart';
import 'package:quectochat/presentation/screens/chat_screen/widgets/typing_view/typing_view.dart';

import 'widgets/reading_view/reading_view.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String? _toId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments is! String) {
      throw UnsupportedError('Expected arguments of type String');
    }
    _toId ??= arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// Область просмотра сообщений
            Expanded(child: ReadingView(toId: _toId!)),

            /// Область написания сообщений
            TypingView(toId: _toId!),
          ],
        ),
      ),
    );
  }
}
