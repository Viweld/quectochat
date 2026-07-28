import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:chat/domain/repositories/chat_repository.dart';
import 'package:chat/presentation/chat_screen/bloc/chat_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_core/core.dart';

class _MockChatRepository extends Mock implements ChatRepository {}

void main() {
  late _MockChatRepository chatRepository;
  late BlocErrorHandler errorHandler;
  late AppToastBus toastBus;
  late StreamController<ChatRepositoryError> errorsController;

  setUp(() {
    chatRepository = _MockChatRepository();
    toastBus = AppToastBus();
    errorHandler = BlocErrorHandler(
      toastBus,
      const ErrorHandlingPolicy(),
      const NoOpErrorReporter(),
    );
    errorsController = StreamController<ChatRepositoryError>.broadcast();

    when(() => chatRepository.subscribeErrors(any())).thenAnswer(
      (Invocation invocation) => errorsController.stream.listen(
        invocation.positionalArguments.first as void Function(ChatRepositoryError),
      ),
    );
    when(
      () => chatRepository.initialize(interlocutorId: any(named: 'interlocutorId')),
    ).thenAnswer((_) async {});
    when(
      () => chatRepository.markAsViewed(interlocutorId: any(named: 'interlocutorId')),
    ).thenAnswer((_) async {});
    when(() => chatRepository.cleanup()).thenAnswer((_) async {});
  });

  tearDown(() async {
    await errorsController.close();
    toastBus.dispose();
  });

  ChatBloc buildBloc() => ChatBloc(chatRepository, errorHandler, interlocutorId: 'peer-1');

  blocTest<ChatBloc, ChatState>(
    'onInitializationRequested initializes repository and marks viewed',
    build: buildBloc,
    expect: () => <Matcher>[],
    verify: (_) {
      verify(() => chatRepository.initialize(interlocutorId: 'peer-1')).called(1);
      verify(() => chatRepository.markAsViewed(interlocutorId: 'peer-1')).called(1);
    },
  );

  blocTest<ChatBloc, ChatState>(
    'onErrorReceived emits showError effect',
    build: buildBloc,
    act: (ChatBloc bloc) =>
        bloc.add(const ChatEvent.onErrorReceived(error: ChatSendMessageFailure())),
    expect: () => <TypeMatcher<ChatState>>[
      isA<ChatState>().having(
        (ChatState s) => s.effect,
        'effect',
        const ChatEffect.showError(kind: AppErrorKind.generic),
      ),
    ],
  );
}
