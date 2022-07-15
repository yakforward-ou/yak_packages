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
    final unary = Stub.unary<String, int>();
    final method = UnaryDelegate<String, int>(unary);
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
      unary.reset();
      unary.stub = (_) {
        assert(false);
        return '';
      };
      expect(
        () => method(data),
        throwsA(isA<AssertionError>()),
        reason: '`method` should throw `AssertionError`',
      );
      expect(
        unary.count,
        1,
        reason: '`stub` should be called once',
      );
    });
    test(
        'GIVEN `stub is not set` '
        'WHEN method.stub is called '
        'THEN throw `UnimplementedError`', () {
      unary.reset();
      unary.stub = (i) => '$i';
      expect(
        method(data),
        '$data',
        reason: '`method` return correct result`',
      );
      expect(
        unary.count,
        1,
        reason: '`stub` should be called once',
      );
    });
  });
  group('`Stub`final Nullary method w/ wrap test', () {
    final nullary = Stub.nullary<int>();
    final method = NullaryDelegate<int>(nullary);
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
      nullary.reset();
      nullary.stub = () {
        assert(false);
        return data;
      };
      expect(
        method.call,
        throwsA(isA<AssertionError>()),
        reason: '`method` should throw `AssertionError`',
      );
      expect(
        nullary.count,
        1,
        reason: '`stub` should be called once',
      );
    });
    test(
        'GIVEN `stub is not set` '
        'WHEN method.stub is called '
        'THEN throw `UnimplementedError`', () {
      nullary.reset();
      nullary.stub = () => data;
      expect(
        method(),
        data,
        reason: '`method` return correct result`',
      );
      expect(
        nullary.count,
        1,
        reason: '`stub` should be called once',
      );
    });
  });
}
