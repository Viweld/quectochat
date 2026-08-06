import 'package:auth/domain/entities/registration_failure.dart';
import 'package:auth/domain/repositories/auth_repository.dart';
import 'package:auth/presentation/registration_screen/bloc/registration_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';

class _MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late _MockAuthRepository authRepository;
  late BlocErrorHandler errorHandler;
  late AppToastBus toastBus;

  setUp(() {
    authRepository = _MockAuthRepository();
    toastBus = AppToastBus();
    errorHandler = BlocErrorHandler(
      toastBus,
      const ErrorHandlingPolicy(),
      const NoOpErrorReporter(),
    );
  });

  tearDown(() => toastBus.dispose());

  RegistrationBloc buildBloc() =>
      RegistrationBloc(authRepository, errorHandler, inviteCode: '7MFKRQ3P');

  blocTest<RegistrationBloc, RegistrationState>(
    'submitRequested with empty fields shows validation errors',
    build: buildBloc,
    act: (RegistrationBloc bloc) => bloc.add(const RegistrationEvent.submitRequested()),
    expect: () => <TypeMatcher<RegistrationState>>[
      isA<RegistrationState>()
          .having(
            (RegistrationState s) => s.displayNameField.isErrorVisible,
            'displayName',
            isTrue,
          )
          .having((RegistrationState s) => s.emailField.isErrorVisible, 'email', isTrue),
    ],
  );

  blocTest<RegistrationBloc, RegistrationState>(
    'submitRequested with email already used emits showError',
    build: buildBloc,
    setUp: () {
      when(
        () => authRepository.registration(
          displayName: any(named: 'displayName'),
          email: any(named: 'email'),
          password: any(named: 'password'),
          inviteCode: any(named: 'inviteCode'),
        ),
      ).thenAnswer(
        (Invocation _) async => const Failure<void, RegistrationFailure>(EmailAlreadyUsedFailure()),
      );
    },
    act: (RegistrationBloc bloc) {
      bloc
        ..add(const RegistrationEvent.displayNameChanged('Ivan'))
        ..add(const RegistrationEvent.emailChanged('a@b.com'))
        ..add(const RegistrationEvent.passwordChanged('password1'))
        ..add(const RegistrationEvent.confirmPasswordChanged('password1'))
        ..add(const RegistrationEvent.submitRequested());
    },
    skip: 4,
    expect: () => <TypeMatcher<RegistrationState>>[
      isA<RegistrationState>().having((RegistrationState s) => s.isLoading, 'loading', isTrue),
      isA<RegistrationState>().having(
        (RegistrationState s) => s.effect,
        'effect',
        const RegistrationEffect.showError(AppErrorKind.emailAlreadyUsed),
      ),
      isA<RegistrationState>().having((RegistrationState s) => s.isLoading, 'loading', isFalse),
    ],
  );

  blocTest<RegistrationBloc, RegistrationState>(
    'submitRequested with network failure emits network showError',
    build: buildBloc,
    setUp: () {
      when(
        () => authRepository.registration(
          displayName: any(named: 'displayName'),
          email: any(named: 'email'),
          password: any(named: 'password'),
          inviteCode: any(named: 'inviteCode'),
        ),
      ).thenAnswer(
        (Invocation _) async =>
            const Failure<void, RegistrationFailure>(RegistrationNetworkFailure()),
      );
    },
    act: (RegistrationBloc bloc) {
      bloc
        ..add(const RegistrationEvent.displayNameChanged('Ivan'))
        ..add(const RegistrationEvent.emailChanged('a@b.com'))
        ..add(const RegistrationEvent.passwordChanged('password1'))
        ..add(const RegistrationEvent.confirmPasswordChanged('password1'))
        ..add(const RegistrationEvent.submitRequested());
    },
    skip: 4,
    expect: () => <TypeMatcher<RegistrationState>>[
      isA<RegistrationState>().having((RegistrationState s) => s.isLoading, 'loading', isTrue),
      isA<RegistrationState>().having(
        (RegistrationState s) => s.effect,
        'effect',
        const RegistrationEffect.showError(AppErrorKind.network),
      ),
      isA<RegistrationState>().having((RegistrationState s) => s.isLoading, 'loading', isFalse),
    ],
  );
}
