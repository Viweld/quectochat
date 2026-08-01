import 'package:chat/presentation/chat_screen/widgets/reading_view/bloc/reading_view_bloc.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/widgets/reading_messages_list.dart';
import 'package:flutter/material.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

class ReadingView extends StatelessWidget {
  const ReadingView({required this.interlocutorId, super.key});

  final String interlocutorId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReadingViewBloc>(
      create: (BuildContext context) => appLocator<ReadingViewBloc>(param1: interlocutorId),
      child: BlocBuilder<ReadingViewBloc, ReadingViewState>(
        builder: (BuildContext context, ReadingViewState state) {
          if (state.isPending) {
            return const Center(child: CommonPendingIndicator());
          }

          return ReadingMessagesList(messages: state.messages, hasNext: state.hasNext);
        },
      ),
    );
  }
}
