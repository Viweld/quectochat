import 'package:flutter_test/flutter_test.dart';
import 'package:shared_core/src/error_handling/transport_error_classifier.dart';
import 'package:shared_core/src/exceptions/api_exception.dart';
import 'package:shared_core/src/exceptions/request_context.dart';

void main() {
  group('classifyTransportFailureText', () {
    test('detects DNS / host lookup failures as network', () {
      const String message =
          'ClientException with SocketException: Failed host lookup: '
          "'cjgncxrgbdosvtveradq.supabase.co' "
          '(OS Error: No address associated with hostname, errno = 7)';

      expect(classifyTransportFailureText(message), TransportErrorKind.network);
    });

    test('detects connection refused as server', () {
      expect(
        classifyTransportFailureText('SocketException: Connection refused'),
        TransportErrorKind.server,
      );
    });

    test('detects timeout as server', () {
      expect(classifyTransportFailureText('Connection timed out'), TransportErrorKind.server);
    });

    test('returns other for business auth messages', () {
      expect(classifyTransportFailureText('Invalid login credentials'), TransportErrorKind.other);
    });
  });

  group('classifyTransportError', () {
    test('uses NetworkException kind', () {
      expect(
        classifyTransportError(
          NetworkException(
            kind: NetworkExceptionKind.offline,
            context: const RequestContext(operation: 'test'),
          ),
        ),
        TransportErrorKind.network,
      );
    });

    test('inspects ServerException cause text', () {
      expect(
        classifyTransportError(
          ServerException(
            context: const RequestContext(operation: 'test'),
            cause: Exception('SocketException: Failed host lookup: example.com'),
          ),
        ),
        TransportErrorKind.network,
      );
    });
  });
}
