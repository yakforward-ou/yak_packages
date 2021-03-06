import 'package:test/test.dart';
import 'package:yak_error_handler/src/custom/error/wrong_handler.dart';
import 'package:yak_error_handler/yak_error_handler.dart';

import '../stub/all.dart';

void main() {
  group('WrongErrorHandler ', () {
    final stub = HandleErrorDelegateStub();
    final handler = ErrorHandler<AvowError>(stub);

    test(
        'GIVEN `ErrorHandler<T>`'
        'WHEN `Error` != T is thrown '
        'THEN WrongErrorHandler is thrown', () {
      stub
        ..reset
        ..stub = () {};

      late final err;
      try {
        try {
          throw Error();
        } on Error catch (e) {
          handler(e);
        }
      } catch (e) {
        err = e;
      }

      expect(
        err,
        isA<WrongErrorHandler>(),
        reason: 'WrongErrorHandler should be thrown',
      );
      expect(
        stub.callCount,
        0,
        reason: '`stub` should not be called',
      );
    });

    test(
        'WHEN `toString` is called'
        'THEN outputs a predictable result', () {
      stub
        ..reset
        ..stub = () {};

      late final message;
      try {
        try {
          throw Error();
        } on Error catch (e) {
          handler(e);
        }
      } catch (e) {
        message = '$e';
      }

      expect(
          message,
          'ErrorHandler failed as'
          'an Error of type Error in place of AvowError',
          reason: '`toString` should be predicatble');
    });

    test(
        'GIVEN `ErrorHandler<T>`'
        'WHEN casted as `ErrorHandler<dynamc>` '
        'THEN `type` still returs `T`', () {
      final handler = ErrorHandler<AssertionError>((_) {});

      final list = [handler];

      expect(
        list[0].type,
        AssertionError,
        reason: 'type should be persisted',
      );
    });
  });
}
