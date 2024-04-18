import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
// coverage:ignore-file

/// a `typedef` for a `ResultUnary` test function
typedef ResultUnaryTest<T, S> = void Function({
  required String name,
  required Unary<T, S> example,
  required Nullary<S> seed,
});

/// an `extension` that generates a basic set of tests for `ResultUnary`
extension ResultUnaryTestX<T extends Object, S> on ResultUnary<T, S> {
  /// run `test` providing a `description` and an `example` function
  void tester({
    required String name,
    required Unary<T, S> example,
    required Nullary<S> seed,
  }) {
    group('test for $name', () {
      final tester = Stub.unary<T, S>();

      setUp(tester.reset);

      test(
          'GIVEN $name original function does not throw '
          'WHEN $name.call '
          'THEN return Success', () {
        tester.stub = example;

        final result = tester(seed());

        expect(
          result,
          isA<Result<T>>(),
          reason: 'tester should not throw',
        );
      });
      test(
          'GIVEN $name original function throws Exception '
          'WHEN $name.call '
          'THEN return Failure', () {
        tester.stub = (_) => throw Exception();

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
        tester.stub = (_) => throw Error();

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
