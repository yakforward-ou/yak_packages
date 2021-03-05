import 'package:test/test.dart';
import 'package:yak_error_handler/src/all.dart';

import '../stub/all.dart';

void main() {
  group('ErrorHandler', () {
    final stub = HandleErrorDelegateStub()..result = () {};
    final handler = ErrorHandler<AssertionError>(stub);
    test(
        'GIVEN `ErrorHandler<T>` '
        'WHEN `Error` != T is thrown '
        'THEN stub is not called', () {
      try {
        throw Error();
      } on Error catch (e) {
        handler(e);
      }

      expect(
        stub.callCount,
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
        handler(e);
      }

      expect(
        stub.callCount,
        1,
        reason: 'stub should be called',
      );
    });
  });
}
