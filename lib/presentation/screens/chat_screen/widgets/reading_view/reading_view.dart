import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quectochat/domain/environment/builders.dep_gen.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';

import '../../../../common/common_pending_indicator.dart';
import '../../../../common/common_toast.dart';
import '../../../../values/values.dart';
import 'widgets/message_bubble.dart';
import 'bloc/reading_view_bloc.dart';

/// КОЛОНКА СООБЩЕНИЙ
class ReadingView extends StatelessWidget {
  const ReadingView({
    required this.toId,
    super.key,
  });

  /// Id собеседника
  final String toId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.depGen().buildReadingViewBloc(toId: toId),
      child: BlocConsumer<ReadingViewBloc, ReadingViewState>(
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

  // КОЛЛБЭКИ от смены состояний:
  void _requestError(BuildContext context, String? errorText) {
    CommonToast.showError(
      context,
      text: errorText ?? context.texts.commonRequestError,
    );
  }
}
