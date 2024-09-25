import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quectochat/dep_provider.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';

import '../../../../common/common_pending_indicator.dart';
import '../../../../values/values.dart';
import 'widgets/message_bubble.dart';
import 'bloc/reading_view_bloc.dart';

/// КОЛОНКА СООБЩЕНИЙ
class ReadingView extends StatelessWidget {
  const ReadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.dep<ReadingViewBloc>(),
      child: BlocBuilder<ReadingViewBloc, ReadingViewState>(
        buildWhen: (_, state) => state.maybeMap(
          // TODO(Vadim): #unimplemented добавить обработку состояния ошибки инициализации
          view: (_) => true,
          pending: (_) => true,
          orElse: () => false,
        ),
        builder: (context, state) => state.maybeMap(
          orElse: () => throw UnimplementedError(
            'Wrong state for ReadingView',
          ),
          // TODO(Vadim): #unimplemented добавить обработку состояния ошибки инициализации
          pending: (s) => const Center(child: CommonPendingIndicator()),
          view: (s) => Padding(
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
                  const SliverToBoxAdapter(child: SizedBox(height: 20)),
                  SliverList.separated(
                    itemCount: s.messages.length,
                    itemBuilder: (context, i) {
                      final message = s.messages.toList().reversed.elementAt(i);
                      return MessageBubble(message);
                    },
                    separatorBuilder: (context, i) =>
                        const SizedBox(height: 10),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
