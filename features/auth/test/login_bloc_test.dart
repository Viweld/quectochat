import 'package:auth/domain/entities/login_failure.dart';
import 'package:auth/domain/repositories/auth_repository.dart';
import 'package:auth/presentation/login_screen/bloc/login_bloc.dart';
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

  LoginBloc buildBloc() => LoginBloc(authRepository, errorHandler);

  blocTest<LoginBloc, LoginState>(
    'registrationRequested emits navigateRegistration effect',
    build: buildBloc,
    act: (LoginBloc bloc) => bloc.add(const LoginEvent.registrationRequested()),
    expect: () => <TypeMatcher<LoginState>>[
      isA<LoginState>().having(
        (LoginState s) => s.effect,
        'effect',
        const LoginEffect.navigateRegistration(),
      ),
    ],
  );

  blocTest<LoginBloc, LoginState>(
    'submitRequested with invalid fields shows field errors',
    build: buildBloc,
    act: (LoginBloc bloc) => bloc.add(const LoginEvent.submitRequested()),
    expect: () => <TypeMatcher<LoginState>>[
      isA<LoginState>()
          .having((LoginState s) => s.emailField.isErrorVisible, 'email visible', isTrue)
          .having((LoginState s) => s.passwordField.isErrorVisible, 'password visible', isTrue),
    ],
  );

  blocTest<LoginBloc, LoginState>(
    'submitRequested success keeps loading false without domain effect',
    build: buildBloc,
    setUp: () {
      when(
        () => authRepository.logIn(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((Invocation _) async => const Success<void, LoginFailure>(null));
    },
    act: (LoginBloc bloc) {
      bloc
        ..add(const LoginEvent.emailChanged('a@b.com'))
        ..add(const LoginEvent.passwordChanged('password1'))
        ..add(const LoginEvent.submitRequested());
    },
    skip: 2,
    expect: () => <TypeMatcher<LoginState>>[
      isA<LoginState>().having((LoginState s) => s.isLoading, 'loading', isTrue),
      isA<LoginState>().having((LoginState s) => s.isLoading, 'loading', isFalse),
    ],
  );

  blocTest<LoginBloc, LoginState>(
    'submitRequested with invalid credential emits showError effect',
    build: buildBloc,
    setUp: () {
      when(
        () => authRepository.logIn(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer(
        (Invocation _) async => const Failure<void, LoginFailure>(InvalidCredentialFailure()),
      );
    },
    act: (LoginBloc bloc) {
      bloc
        ..add(const LoginEvent.emailChanged('a@b.com'))
        ..add(const LoginEvent.passwordChanged('password1'))
        ..add(const LoginEvent.submitRequested());
    },
    skip: 2,
    expect: () => <TypeMatcher<LoginState>>[
      isA<LoginState>().having((LoginState s) => s.isLoading, 'loading', isTrue),
      isA<LoginState>().having(
        (LoginState s) => s.effect,
        'effect',
        const LoginEffect.showError(AppErrorKind.invalidCredential),
      ),
      isA<LoginState>().having((LoginState s) => s.isLoading, 'loading', isFalse),
    ],
  );

  blocTest<LoginBloc, LoginState>(
    'submitRequested with network failure emits network showError',
    build: buildBloc,
    setUp: () {
      when(
        () => authRepository.logIn(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer(
        (Invocation _) async => const Failure<void, LoginFailure>(LoginNetworkFailure()),
      );
    },
    act: (LoginBloc bloc) {
      bloc
        ..add(const LoginEvent.emailChanged('a@b.com'))
        ..add(const LoginEvent.passwordChanged('password1'))
        ..add(const LoginEvent.submitRequested());
    },
    skip: 2,
    expect: () => <TypeMatcher<LoginState>>[
      isA<LoginState>().having((LoginState s) => s.isLoading, 'loading', isTrue),
      isA<LoginState>().having(
        (LoginState s) => s.effect,
        'effect',
        const LoginEffect.showError(AppErrorKind.network),
      ),
      isA<LoginState>().having((LoginState s) => s.isLoading, 'loading', isFalse),
    ],
  );
}
