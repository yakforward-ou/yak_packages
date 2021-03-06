import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';

import '../stub/all.dart';

void main() {
  group('AvowError & avow', () {
    final stub = HandleErrorDelegateStub();
    final handler = ErrorHandler<void, AvowError>(stub);

    test(
        'WHEN `Error` != AvowError is thrown '
        'THEN stub is not called', () {
      stub
        ..reset
        ..stub = () {};
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
        'WHEN `avow(false)`'
        'THEN should throw `AvowError`', () {
      stub
        ..reset
        ..stub = () {};
      try {
        avow(false);
      } on Error catch (e) {
        handler(e);
      }

      expect(
        stub.callCount,
        1,
        reason: 'stub should be called',
      );
    });

    test(
        'WHEN `avow(true)`'
        'THEN should succees', () {
      stub
        ..reset
        ..stub = () {};
      try {
        avow(true);
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
        'WHEN `toString` is called'
        'THEN outputs a predictable result', () {
      stub
        ..reset
        ..stub = () {};

      var err;
      try {
        avow(false, '...successfully');
      } on Error catch (e) {
        err = e;
      }
      expect((err as AvowError).toString(), 'Avow failed: "...successfully"');

      try {
        avow(false);
      } on Error catch (e) {
        err = e;
      }
      expect((err as AvowError).toString(), 'Avow failed');
    });
  });
}
