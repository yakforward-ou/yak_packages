import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

class NullaryTester implements NullaryDelegate<int> {
  const NullaryTester();
  @override
  int call() => 42;
}

class UnaryTester implements UnaryDelegate<int, int> {
  const UnaryTester();
  @override
  int call(i) => i * 2;
}

class NullaryAsyncTester implements NullaryDelegateAsync<int> {
  const NullaryAsyncTester();
  @override
  Future<int> call() => Future.sync(() => 42);
}

class UnaryAsyncTester implements UnaryDelegateAsync<int, int> {
  const UnaryAsyncTester();
  @override
  Future<int> call(i) => Future.sync(() => i * 2);
}

void main() {
  group('ResultNullaryDelegateX', () {
    const tester = NullaryTester();
    test(
        'GIVEN a Nullary function '
        'WHEN nullary.run '
        'THEN returns a ResultNullary', () {
      expect(
        tester.run,
        isA<ResultNullary<int>>(),
        reason: 'return type should be predictable',
      );
    });
  });
  group('ResultNullaryAsyncX', () {
    const tester = NullaryAsyncTester();

    test(
        'GIVEN a NullaryAsync function '
        'WHEN function.run '
        'THEN returns a ResultNullaryAsync', () {
      expect(
        tester.runAsync,
        isA<ResultNullaryAsync<int>>(),
        reason: 'return type should be predictable',
      );
    });
  });
  group('ResultUnaryDelegateX', () {
    const tester = UnaryTester();

    test(
        'GIVEN a Unary function '
        'WHEN function.run '
        'THEN returns a ResultUnary', () {
      expect(
        tester.run,
        isA<ResultUnary<int, int>>(),
        reason: 'return type should be predictable',
      );
    });
  });
  group('ResultNullaryDelegateX', () {
    const tester = UnaryAsyncTester();

    test(
        'GIVEN a UnaryAsync function '
        'WHEN function.run '
        'THEN returns a ResultUnaryAsync', () {
      expect(
        tester.runAsync,
        isA<ResultUnaryAsync<int, int>>(),
        reason: 'return type should be predictable',
      );
    });
  });
}
