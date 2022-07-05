import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
// coverage:ignore-file

/// a `typedef` for a `RunUnarySync` test function
typedef RunUnarySyncTest<T, S> = void Function({
  required String name,
  required Unary<T, S> example,
  required Nullary<S> seed,
});

/// an `extension` that generates a basic set of tests for `RunUnarySync`
extension RunUnarySyncTestX<T, S> on RunUnarySync<T, S> {
  /// run `test` providing a `description` and an `example` function
  void tester({
    required String name,
    required Unary<T, S> example,
    required Nullary<S> seed,
  }) {
    group('test for $name', () {
      final unary = unaryStub<T, S>();
      RunUnarySync<T, S> buildTester() => runUnarySync(unary.wrap);

      test(
          'GIVEN $name original function does not throw '
          'WHEN $name.call '
          'THEN return Success', () {
        unary
          ..reset
          ..stub = example;

        final tester = buildTester();
        final result = tester(seed());

        expect(
          result,
          isA<Success<T>>(),
          reason: 'tester should not throw',
        );
      });
      test(
          'GIVEN $name original function throws Exception '
          'WHEN $name.call '
          'THEN return Failure', () {
        unary
          ..reset
          ..stub = (_) => throw Exception();

        final tester = buildTester();
        final result = tester(seed());

        expect(
          result,
          isA<Failure<T>>(),
          reason: 'tester should throw',
        );
      });

      test(
          'GIVEN $name original function throws Error '
          'WHEN $name.call '
          'THEN return Failure', () {
        unary
          ..reset
          ..stub = (_) => throw Error();

        final tester = buildTester();
        final result = tester(seed());

        expect(
          result,
          isA<Failure<T>>(),
          reason: 'tester should throw',
        );
      });
    });
  }
}
