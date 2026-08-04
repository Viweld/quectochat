import 'package:chat/presentation/chat_screen/bloc/chat_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Clears/restores push-suppression presence when the app leaves the foreground.
final class ChatActivePresenceLifecycle extends StatefulWidget {
  const ChatActivePresenceLifecycle({required this.child, super.key});

  final Widget child;

  @override
  State<ChatActivePresenceLifecycle> createState() => _ChatActivePresenceLifecycleState();
}

final class _ChatActivePresenceLifecycleState extends State<ChatActivePresenceLifecycle>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final ChatBloc bloc = context.read<ChatBloc>();
    switch (state) {
      case AppLifecycleState.resumed:
        bloc.add(const ChatEvent.onAppResumed());
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        bloc.add(const ChatEvent.onAppPaused());
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
