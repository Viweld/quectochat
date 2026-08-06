import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/domain/repositories/home_repository.dart';
import 'package:home/presentation/home_screen/bloc/home_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';

class _MockHomeRepository extends Mock implements HomeRepository {}

class _MockAuthSessionPort extends Mock implements AuthSessionPort {}

void main() {
  late _MockHomeRepository homeRepository;
  late _MockAuthSessionPort authSessionPort;
  late BlocErrorHandler errorHandler;
  late AppToastBus toastBus;
  late StreamController<Set<Interlocutor>> interlocutorsController;

  setUp(() {
    homeRepository = _MockHomeRepository();
    authSessionPort = _MockAuthSessionPort();
    toastBus = AppToastBus();
    errorHandler = BlocErrorHandler(
      toastBus,
      const ErrorHandlingPolicy(),
      const NoOpErrorReporter(),
    );
    interlocutorsController = StreamController<Set<Interlocutor>>.broadcast();

    when(() => homeRepository.initialize()).thenAnswer((_) async {});
    when(() => homeRepository.getCurrentUser()).thenAnswer((_) async => null);
    when(() => homeRepository.subscribe(any())).thenAnswer(
      (Invocation invocation) => interlocutorsController.stream.listen(
        invocation.positionalArguments.first as void Function(Set<Interlocutor>),
      ),
    );
    when(() => homeRepository.getInterlocutors()).thenAnswer(
      (_) async => const Paginated<Interlocutor>(hasNext: false, result: <Interlocutor>[]),
    );
    when(
      () => homeRepository.getInterlocutors(lastInterlocutorId: any(named: 'lastInterlocutorId')),
    ).thenAnswer(
      (_) async => const Paginated<Interlocutor>(hasNext: false, result: <Interlocutor>[]),
    );
  });

  tearDown(() async {
    await interlocutorsController.close();
    toastBus.dispose();
  });

  HomeBloc buildBloc() => HomeBloc(authSessionPort, homeRepository, errorHandler);

  blocTest<HomeBloc, HomeState>(
    'onInitializationRequested loads interlocutors',
    build: buildBloc,
    expect: () => <TypeMatcher<HomeState>>[
      isA<HomeState>()
          .having((HomeState s) => s.isFirstLoading, 'firstLoading', isFalse)
          .having((HomeState s) => s.interlocutors, 'list', isEmpty)
          .having((HomeState s) => s.loadError, 'loadError', isNull),
    ],
    verify: (_) {
      verify(() => homeRepository.initialize()).called(1);
      verify(() => homeRepository.getInterlocutors()).called(1);
    },
  );

  blocTest<HomeBloc, HomeState>(
    'onNextPageRequested with empty list does not request next page',
    build: buildBloc,
    // Wait for init fetch to finish with empty list (hasNext becomes false via finally).
    wait: const Duration(milliseconds: 10),
    act: (HomeBloc bloc) => bloc.add(const HomeEvent.onNextPageRequested()),
    verify: (HomeBloc bloc) {
      expect(bloc.state.hasNext, isFalse);
      expect(bloc.state.interlocutors, isEmpty);
      // Only the initial non-paginated fetch; no cursor-based page request.
      verify(() => homeRepository.getInterlocutors()).called(1);
    },
  );

  blocTest<HomeBloc, HomeState>(
    'failed first fetch sets loadError and hasNext to false',
    build: buildBloc,
    setUp: () {
      when(() => homeRepository.getInterlocutors()).thenThrow(
        NetworkException(
          kind: NetworkExceptionKind.offline,
          context: const RequestContext(operation: 'getInterlocutors'),
        ),
      );
    },
    expect: () => <TypeMatcher<HomeState>>[
      isA<HomeState>()
          .having((HomeState s) => s.isFirstLoading, 'firstLoading', isFalse)
          .having((HomeState s) => s.hasNext, 'hasNext', isFalse)
          .having((HomeState s) => s.interlocutors, 'list', isEmpty)
          .having((HomeState s) => s.loadError?.kind, 'loadError', AppErrorKind.network),
    ],
  );

  blocTest<HomeBloc, HomeState>(
    'retry after load error clears loadError and reloads',
    build: buildBloc,
    setUp: () {
      int callCount = 0;
      when(() => homeRepository.getInterlocutors()).thenAnswer((_) async {
        callCount += 1;
        if (callCount == 1) {
          throw NetworkException(
            kind: NetworkExceptionKind.offline,
            context: const RequestContext(operation: 'getInterlocutors'),
          );
        }
        return const Paginated<Interlocutor>(
          hasNext: false,
          result: <Interlocutor>[Interlocutor(userId: '1', displayName: 'A B')],
        );
      });
    },
    wait: const Duration(milliseconds: 10),
    act: (HomeBloc bloc) => bloc.add(const HomeEvent.onFetchRequested()),
    verify: (HomeBloc bloc) {
      expect(bloc.state.loadError, isNull);
      expect(bloc.state.interlocutors, hasLength(1));
      verify(() => homeRepository.getInterlocutors()).called(2);
    },
  );

  blocTest<HomeBloc, HomeState>(
    'onLogoutTapped calls AuthSessionPort.logOut',
    build: buildBloc,
    setUp: () {
      when(() => authSessionPort.logOut()).thenAnswer((_) async {});
    },
    wait: const Duration(milliseconds: 10),
    act: (HomeBloc bloc) => bloc.add(const HomeEvent.onLogoutTapped()),
    verify: (_) => verify(() => authSessionPort.logOut()).called(1),
  );
}
