import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';

void main() {
  final stub = unaryStub<void, AvowError>()..stub = (_) {};
  final handler = ErrorHandler(stub.wrap);
  group('ErrorHandlerCovariantX test', () {
    test(
        'GIVEN `ErrorHandler<AvowError>`'
        'WHEN covatiant'
        'THEN is a ErrorHandler<Error>', () {
      expect(
        handler,
        isA<ErrorHandler<AvowError>>(),
        reason: 'type should be as expected',
      );

      expect(
        handler.covariant,
        isA<ErrorHandler<AvowError>>(),
        reason: 'type should be as expected',
      );
    });
  });
}
