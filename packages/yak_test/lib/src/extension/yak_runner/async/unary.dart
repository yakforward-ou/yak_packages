import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
// coverage:ignore-file

/// a `typedef` for a `ResultUnaryAsync` test function
typedef ResultUnaryAsyncTest<T, S> = void Function({
  required String name,
  required UnaryAsync<T, S> example,
  required Nullary<S> seed,
});

/// an `extension` that generates a basic set of tests for `ResultUnaryAsync`
extension ResultUnaryAsyncTestX<T extends Object, S> on ResultUnaryAsync<T, S> {
  /// run `test` providing a `description` and an `example` function
  void tester({
    required String name,
    required UnaryAsync<T, S> example,
    required Nullary<S> seed,
  }) =>
      group('test for $name', () {
        final tester = Stub.unary<Future<T>, S>();

        setUp(tester.reset);

        test(
            'GIVEN $name original function does not throw '
            'WHEN $name.call '
            'THEN return Success', () {
          tester.stub = example;

          expectLater(
            tester(seed()),
            isA<Result<T>>(),
            reason: 'tester should not throw',
          );
        });
        test(
            'GIVEN $name original function throws Exception '
            'WHEN $name.call '
            'THEN return Failure', () {
          tester.stub = (_) => throw Exception();

          expectLater(
            tester(seed()),
            isA<Failure<T>>(),
            reason: 'tester should throw',
          );
        });

        test(
            'GIVEN $name original function throws Error '
            'WHEN $name.call '
            'THEN return Failure', () {
          tester.stub = (_) => throw Error();

          expectLater(
            tester(seed()),
            isA<Failure<T>>(),
            reason: 'tester should throw',
          );
        });
      });
}
