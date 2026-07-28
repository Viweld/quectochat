import 'package:flutter_test/flutter_test.dart';
import 'package:shared_core/src/error_handling/bloc_error_handler.dart';
import 'package:shared_core/src/error_handling/error_handling_policy.dart';
import 'package:shared_core/src/error_handling/error_presentation.dart';
import 'package:shared_core/src/error_handling/logging_error_reporter.dart';
import 'package:shared_core/src/events/app_toast_bus.dart';
import 'package:shared_core/src/events/app_toast_events.dart';
import 'package:shared_core/src/exceptions/api_exception.dart';
import 'package:shared_core/src/exceptions/request_context.dart';

void main() {
  late AppToastBus toastBus;
  late BlocErrorHandler handler;
  late List<AppToastEvent> fired;

  setUp(() {
    toastBus = AppToastBus();
    fired = <AppToastEvent>[];
    toastBus.stream.listen(fired.add);
    handler = BlocErrorHandler(toastBus, const ErrorHandlingPolicy(), const NoOpErrorReporter());
  });

  tearDown(() => toastBus.dispose());

  test('NetworkException shows toast and does not rethrow by default', () async {
    final ErrorPresentation presentation = handler.handle(
      NetworkException(
        kind: NetworkExceptionKind.offline,
        context: const RequestContext(operation: 'test'),
      ),
      stackTrace: StackTrace.current,
    );

    expect(presentation.kind, ErrorPresentationKind.toast);
    expect(presentation.shouldRethrow, isFalse);
    expect(presentation.toastKind, AppToastErrorKind.network);
    await Future<void>.delayed(Duration.zero);
    expect(fired, hasLength(1));
  });

  test('UnexpectedApiException rethrows by default', () {
    final ErrorPresentation presentation = handler.handle(
      UnexpectedApiException(context: const RequestContext(operation: 'test')),
      stackTrace: StackTrace.current,
    );

    expect(presentation.shouldRethrow, isTrue);
  });

  test('isSilent suppresses toast', () {
    final ErrorPresentation presentation = handler.handle(
      NetworkException(
        kind: NetworkExceptionKind.timeout,
        context: const RequestContext(operation: 'test'),
      ),
      stackTrace: StackTrace.current,
      isSilent: true,
    );

    expect(presentation.kind, ErrorPresentationKind.toast);
    expect(fired, isEmpty);
  });

  test('AuthException is silent by policy', () {
    final ErrorPresentation presentation = handler.handle(
      AuthException(context: const RequestContext(operation: 'login')),
      stackTrace: StackTrace.current,
    );

    expect(presentation.kind, ErrorPresentationKind.silent);
    expect(fired, isEmpty);
  });
}
