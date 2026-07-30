import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:chat/domain/entities/interlocutor_status.dart';
import 'package:chat/domain/repositories/chat_repository.dart';
import 'package:chat/presentation/chat_screen/bloc/chat_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';

class _MockChatRepository extends Mock implements ChatRepository {}

class _MockPresencePort extends Mock implements PresencePort {}

void main() {
  late _MockChatRepository chatRepository;
  late _MockPresencePort presencePort;
  late BlocErrorHandler errorHandler;
  late AppToastBus toastBus;
  late StreamController<ChatRepositoryError> errorsController;
  late StreamController<Set<String>> onlineController;
  late StreamController<DateTime?> lastSeenController;
  late StreamController<bool> typingController;

  setUp(() {
    chatRepository = _MockChatRepository();
    presencePort = _MockPresencePort();
    toastBus = AppToastBus();
    errorHandler = BlocErrorHandler(
      toastBus,
      const ErrorHandlingPolicy(),
      const NoOpErrorReporter(),
    );
    errorsController = StreamController<ChatRepositoryError>.broadcast();
    onlineController = StreamController<Set<String>>.broadcast();
    lastSeenController = StreamController<DateTime?>.broadcast();
    typingController = StreamController<bool>.broadcast();

    when(() => chatRepository.subscribeErrors(any())).thenAnswer(
      (Invocation invocation) => errorsController.stream.listen(
        invocation.positionalArguments.first as void Function(ChatRepositoryError),
      ),
    );
    when(() => chatRepository.subscribeInterlocutorTyping(any())).thenAnswer(
      (Invocation invocation) => typingController.stream.listen(
        invocation.positionalArguments.first as void Function(bool),
      ),
    );
    when(() => presencePort.onlineUserIdsStream).thenAnswer((_) => onlineController.stream);
    when(() => presencePort.watchLastSeenAt(any())).thenAnswer((_) => lastSeenController.stream);
    when(
      () => chatRepository.initialize(interlocutorId: any(named: 'interlocutorId')),
    ).thenAnswer((_) async {});
    when(
      () => chatRepository.markAsRead(interlocutorId: any(named: 'interlocutorId')),
    ).thenAnswer((_) async {});
    when(() => chatRepository.cleanup()).thenAnswer((_) async {});
  });

  tearDown(() async {
    await errorsController.close();
    await onlineController.close();
    await lastSeenController.close();
    await typingController.close();
    toastBus.dispose();
  });

  ChatBloc buildBloc() =>
      ChatBloc(chatRepository, presencePort, errorHandler, interlocutorId: 'peer-1');

  blocTest<ChatBloc, ChatState>(
    'onInitializationRequested initializes repository and marks read',
    build: buildBloc,
    expect: () => <Matcher>[],
    verify: (_) {
      verify(() => chatRepository.initialize(interlocutorId: 'peer-1')).called(1);
      verify(() => chatRepository.markAsRead(interlocutorId: 'peer-1')).called(1);
    },
  );

  blocTest<ChatBloc, ChatState>(
    'emits online when peer appears in presence roster',
    build: buildBloc,
    act: (ChatBloc bloc) async {
      onlineController.add(<String>{'peer-1'});
      await Future<void>.delayed(Duration.zero);
    },
    expect: () => <TypeMatcher<ChatState>>[
      isA<ChatState>().having(
        (ChatState s) => s.interlocutorStatus,
        'interlocutorStatus',
        InterlocutorStatus.online,
      ),
    ],
  );

  blocTest<ChatBloc, ChatState>(
    'typing status has priority over online',
    build: buildBloc,
    act: (ChatBloc bloc) async {
      onlineController.add(<String>{'peer-1'});
      await Future<void>.delayed(Duration.zero);
      typingController.add(true);
      await Future<void>.delayed(Duration.zero);
    },
    expect: () => <TypeMatcher<ChatState>>[
      isA<ChatState>().having(
        (ChatState s) => s.interlocutorStatus,
        'interlocutorStatus',
        InterlocutorStatus.online,
      ),
      isA<ChatState>().having(
        (ChatState s) => s.interlocutorStatus,
        'interlocutorStatus',
        InterlocutorStatus.typing,
      ),
    ],
  );

  blocTest<ChatBloc, ChatState>(
    'emits recentlyOffline when peer left within threshold',
    build: buildBloc,
    act: (ChatBloc bloc) async {
      onlineController.add(<String>{});
      await Future<void>.delayed(Duration.zero);
      lastSeenController.add(DateTime.now().toUtc().subtract(const Duration(minutes: 1)));
      await Future<void>.delayed(Duration.zero);
    },
    expect: () => <TypeMatcher<ChatState>>[
      isA<ChatState>().having(
        (ChatState s) => s.interlocutorStatus,
        'interlocutorStatus',
        InterlocutorStatus.longOffline,
      ),
      isA<ChatState>().having(
        (ChatState s) => s.interlocutorStatus,
        'interlocutorStatus',
        InterlocutorStatus.recentlyOffline,
      ),
    ],
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
