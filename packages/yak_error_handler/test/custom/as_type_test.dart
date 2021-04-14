import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';

class Foo {}

class Bar {}

class Baz extends Bar {}

void main() {
  group('AsTypeError & asType<T>', () {
    final stub = unaryStub<void, Error>()..stub = (e) {};
    final handler = ErrorHandler<AsTypeError>(stub.wrap);
    final foo = Foo();
    final baz = Baz();
    test(
        'WHEN `Error` != AsTypeError is thrown '
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
        'GIVEN `Foo` does not extends nor implements `Bar`'
        'WHEN `Foo asType<Bar> should throw'
        'THEN should theow `AsTypeError`', () {
      stub.reset;
      try {
        asType<Bar>(foo);
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
        'GIVEN `Baz` does extends nor implements `Bar`'
        'WHEN `Baz asType<Bar> '
        'THEN should succeed', () {
      stub.reset;

      try {
        asType<Bar>(baz);
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
