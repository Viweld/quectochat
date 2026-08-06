import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:chat/domain/entities/message.dart';
import 'package:chat/domain/repositories/chat_repository.dart';
import 'package:chat/presentation/chat_screen/widgets/reading_view/bloc/reading_view_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';

class _MockChatRepository extends Mock implements ChatRepository {}

Message _message({required String id, required DateTime createdAt}) => Message(
  id: id,
  chatId: 'chat-1',
  fromId: 'user-1',
  toId: 'peer-1',
  createdAt: createdAt,
  content: id,
  type: MessageContentType.text,
  deliveredAt: null,
  readAt: null,
  isOwn: true,
);

void main() {
  late _MockChatRepository chatRepository;
  late BlocErrorHandler errorHandler;
  late AppToastBus toastBus;
  late StreamController<Iterable<Message>> messagesController;

  final DateTime t0 = DateTime.utc(2026, 8);
  final Message older = _message(id: 'm-older', createdAt: t0);
  final Message newer = _message(id: 'm-newer', createdAt: t0.add(const Duration(minutes: 1)));
  final Message newest = _message(id: 'm-newest', createdAt: t0.add(const Duration(minutes: 2)));

  setUp(() {
    chatRepository = _MockChatRepository();
    toastBus = AppToastBus();
    errorHandler = BlocErrorHandler(
      toastBus,
      const ErrorHandlingPolicy(),
      const NoOpErrorReporter(),
    );
    messagesController = StreamController<Iterable<Message>>.broadcast();

    when(() => chatRepository.subscribeEvents(any())).thenAnswer(
      (Invocation invocation) => messagesController.stream.listen(
        invocation.positionalArguments.first as void Function(Iterable<Message>),
      ),
    );
    when(
      () => chatRepository.subscribeChatCleared(any()),
    ).thenAnswer((_) => const Stream<void>.empty().listen((_) {}));
  });

  tearDown(() async {
    await messagesController.close();
    toastBus.dispose();
  });

  ReadingViewBloc buildBloc() =>
      ReadingViewBloc(chatRepository, errorHandler, interlocutorId: 'peer-1');

  blocTest<ReadingViewBloc, ReadingViewState>(
    'init loads newest page without cursor',
    build: () {
      when(
        () => chatRepository.getChatMessages(
          interlocutorId: any(named: 'interlocutorId'),
          lastMessageId: any(named: 'lastMessageId'),
        ),
      ).thenAnswer(
        (_) async => Paginated<Message>(hasNext: true, result: <Message>[newer, newest]),
      );
      return buildBloc();
    },
    expect: () => <Matcher>[
      isA<ReadingViewState>().having((ReadingViewState s) => s.isPending, 'isPending', true),
      isA<ReadingViewState>()
          .having((ReadingViewState s) => s.isPending, 'isPending', false)
          .having(
            (ReadingViewState s) => s.messages.map((Message m) => m.id).toList(),
            'messages',
            <String>['m-newer', 'm-newest'],
          )
          .having((ReadingViewState s) => s.hasNext, 'hasNext', true),
    ],
    verify: (_) {
      verify(() => chatRepository.getChatMessages(interlocutorId: 'peer-1')).called(1);
    },
  );

  blocTest<ReadingViewBloc, ReadingViewState>(
    'next page uses oldest loaded id and prepends older messages',
    build: () {
      when(() => chatRepository.getChatMessages(interlocutorId: 'peer-1')).thenAnswer(
        (_) async => Paginated<Message>(hasNext: true, result: <Message>[newer, newest]),
      );
      when(
        () => chatRepository.getChatMessages(interlocutorId: 'peer-1', lastMessageId: 'm-newer'),
      ).thenAnswer((_) async => Paginated<Message>(hasNext: false, result: <Message>[older]));
      return buildBloc();
    },
    act: (ReadingViewBloc bloc) async {
      await Future<void>.delayed(Duration.zero);
      bloc.add(const ReadingViewEvent.onNextPageRequested());
    },
    expect: () => <Matcher>[
      isA<ReadingViewState>().having((ReadingViewState s) => s.isPending, 'isPending', true),
      isA<ReadingViewState>()
          .having((ReadingViewState s) => s.isPending, 'isPending', false)
          .having((ReadingViewState s) => s.messages.length, 'messages.length', 2),
      isA<ReadingViewState>().having(
        (ReadingViewState s) => s.isNextLoading,
        'isNextLoading',
        true,
      ),
      isA<ReadingViewState>()
          .having((ReadingViewState s) => s.isNextLoading, 'isNextLoading', false)
          .having(
            (ReadingViewState s) => s.messages.map((Message m) => m.id).toList(),
            'messages',
            <String>['m-older', 'm-newer', 'm-newest'],
          )
          .having((ReadingViewState s) => s.hasNext, 'hasNext', false),
    ],
  );
}
