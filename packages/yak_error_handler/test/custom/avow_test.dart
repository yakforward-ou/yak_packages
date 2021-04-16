import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';

void main() {
  group('AvowError & avow', () {
    final stub = unaryStub<void, Error>()..stub = (e) {};
    final handler = ErrorHandler<AvowError>(stub.wrap);

    test(
        'WHEN `Error` != AvowError is thrown '
        'THEN stub is not called', () {
      stub.reset;

      try {
        throw Error();
      } on Error catch (e) {
        if (e.runtimeType == handler.type) {
          handler(e);
        }
      }

      expect(
        stub.count,
        0,
        reason: 'stub should not be called',
      );
    });
    test(
        'WHEN `avow(false)`'
        'THEN should throw `AvowError`', () {
      stub.reset;

      try {
        avow(false);
      } on Error catch (e) {
        if (e.runtimeType == handler.type) {
          handler(e);
        }
      }

      expect(
        stub.count,
        1,
        reason: 'stub should be called',
      );
    });

    test(
        'WHEN `avow(true)`'
        'THEN should succees', () {
      stub.reset;

      try {
        avow(true);
      } on Error catch (e) {
        if (e.runtimeType == handler.type) {
          handler(e);
        }
      }
      expect(
        stub.count,
        0,
        reason: 'stub should not be called',
      );
    });

    test(
        'WHEN `toString` is called'
        'THEN outputs a predictable result', () {
      stub.reset;

      var message;
      try {
        avow(false, '...successfully');
      } on AvowError catch (e) {
        message = '$e';
      }
      expect(
        message,
        'Avow failed: "...successfully"',
        reason: '`toString` should be predicatble',
      );

      try {
        avow(false);
      } on AvowError catch (e) {
        message = '$e';
      }
      expect(
        message,
        'Avow failed',
        reason: '`toString` should be predicatble',
      );
    });
  });
}
