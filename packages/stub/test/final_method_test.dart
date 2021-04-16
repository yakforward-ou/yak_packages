import 'package:stub/stub.dart';
import 'package:test/test.dart';

class UnaryDelegate<T, S> {
  final T Function(S) _fun;
  UnaryDelegate(this._fun);
  T call(S arg) => _fun(arg);
}

class NullaryDelegate<T> {
  final T Function() _fun;
  NullaryDelegate(this._fun);
  T call() => _fun();
}

void main() {
  group('`Stub`final Unary method w/ wrap test', () {
    final stub = unaryStub<String, int>();
    final method = UnaryDelegate<String, int>(stub.wrap);
    const data = 1;
    test(
        'GIVEN `stub is not set` '
        'WHEN method.stub is called '
        'THEN throw `UnimplementedError`', () {
      expect(
        () => method(data),
        throwsA(isA<UnimplementedError>()),
        reason: '`method` should throw `UnimplementedError`',
      );
    });
    test(
        'GIVEN `stub is not set` '
        'WHEN method.stub is called '
        'THEN throw `UnimplementedError`', () {
      stub.reset;
      stub.stub = (_) {
        assert(false);
        return '';
      };
      expect(
        () => method(data),
        throwsA(isA<AssertionError>()),
        reason: '`method` should throw `AssertionError`',
      );
      expect(
        stub.count,
        1,
        reason: '`stub` should be called once',
      );
    });
    test(
        'GIVEN `stub is not set` '
        'WHEN method.stub is called '
        'THEN throw `UnimplementedError`', () {
      stub.reset;
      stub.stub = (i) => '$i';
      expect(
        method(data),
        '$data',
        reason: '`method` return correct result`',
      );
      expect(
        stub.count,
        1,
        reason: '`stub` should be called once',
      );
    });
  });
  group('`Stub`final Nullary method w/ wrap test', () {
    final stub = nullaryStub<int>();
    final method = NullaryDelegate<int>(stub.wrap);
    const data = 1;
    test(
        'GIVEN `stub is not set` '
        'WHEN method.stub is called '
        'THEN throw `UnimplementedError`', () {
      expect(
        method.call,
        throwsA(isA<UnimplementedError>()),
        reason: '`method` should throw `UnimplementedError`',
      );
    });
    test(
        'GIVEN `stub is not set` '
        'WHEN method.stub is called '
        'THEN throw `UnimplementedError`', () {
      stub.reset;
      stub.stub = () {
        assert(false);
        return data;
      };
      expect(
        method.call,
        throwsA(isA<AssertionError>()),
        reason: '`method` should throw `AssertionError`',
      );
      expect(
        stub.count,
        1,
        reason: '`stub` should be called once',
      );
    });
    test(
        'GIVEN `stub is not set` '
        'WHEN method.stub is called '
        'THEN throw `UnimplementedError`', () {
      stub.reset;
      stub.stub = () => data;
      expect(
        method(),
        data,
        reason: '`method` return correct result`',
      );
      expect(
        stub.count,
        1,
        reason: '`stub` should be called once',
      );
    });
  });
}
