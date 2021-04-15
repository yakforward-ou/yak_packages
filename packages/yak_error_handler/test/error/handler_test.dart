import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
import '../stub/handler_error_delegate.dart';

void main() {
  group('ErrorHandler', () {
    final mock = MockHandleErrorDelegate()..stub.stub = (e) {};
    final handler = ErrorHandler<AssertionError>(mock);
    test(
        'GIVEN `ErrorHandler<T>` '
        'WHEN `Error` != T is thrown '
        'THEN stub is not called', () {
      try {
        throw Error();
      } on Error catch (e) {
        if (e.runtimeType == handler.type) {
          handler(e);
        }
      }

      expect(
        mock.stub.count,
        0,
        reason: 'stub should not be called',
      );
    });
    test(
        'GIVEN `ErrorHandler<T>` '
        'WHEN `Error` == T is thrown '
        'THEN stub is not called', () {
      try {
        throw AssertionError();
      } on Error catch (e) {
        if (e.runtimeType == handler.type) {
          handler(e);
        }
      }

      expect(
        mock.stub.count,
        1,
        reason: 'stub should be called',
      );
    });
  });
}
