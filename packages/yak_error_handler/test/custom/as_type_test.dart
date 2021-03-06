import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';

import '../stub/all.dart';

class Foo {}

class Bar {}

class Baz extends Bar {}

void main() {
  group('AsTypeError & asType<T>', () {
    final stub = HandleErrorDelegateStub();
    final handler = ErrorHandler<AsTypeError>(stub);
    final foo = Foo();
    final baz = Baz();
    test(
        'WHEN `Error` != AsTypeError is thrown '
        'THEN stub is not called', () {
      stub
        ..reset
        ..stub = () {};
      try {
        throw Error();
      } on Error catch (e) {
        if (e.runtimeType == handler.type) {
          handler(e);
        }
      }

      expect(
        stub.callCount,
        0,
        reason: 'stub should not be called',
      );
    });
    test(
        'GIVEN `Foo` does not extends nor implements `Bar`'
        'WHEN `Foo asType<Bar> should throw'
        'THEN should theow `AsTypeError`', () {
      stub
        ..reset
        ..stub = () {};
      try {
        asType<Bar>(foo);
      } on Error catch (e) {
        if (e.runtimeType == handler.type) {
          handler(e);
        }
      }

      expect(
        stub.callCount,
        1,
        reason: 'stub should be called',
      );
    });

    test(
        'GIVEN `Baz` does extends nor implements `Bar`'
        'WHEN `Baz asType<Bar> '
        'THEN should succeed', () {
      stub
        ..reset
        ..stub = () {};
      try {
        asType<Bar>(baz);
      } on Error catch (e) {
        if (e.runtimeType == handler.type) {
          handler(e);
        }
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

      var message;
      try {
        asType<Bar>(foo);
      } on AsTypeError catch (e) {
        message = '$e';
      }
      expect(message, 'AsType failed: "object is a Foo"');

      try {
        throw AsTypeError();
      } on AsTypeError catch (e) {
        message = '$e';
      }
      expect(message, 'AsType failed');
    });
  });
}
