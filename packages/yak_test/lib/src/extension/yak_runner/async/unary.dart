import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
// coverage:ignore-file

/// a `typedef` for a `RunUnaryAsync` test function
typedef RunUnaryAsyncTest<T, S> = void Function({
  required String name,
  required UnaryAsync<T, S> example,
  required Nullary<S> seed,
});

/// an `extension` that generates a basic set of tests for `RunUnaryAsync`
extension RunUnaryAsyncTestX<T, S> on RunUnaryAsync<T, S> {
  /// run `test` providing a `description` and an `example` function
  void tester({
    required String name,
    required UnaryAsync<T, S> example,
    required Nullary<S> seed,
  }) {
    group('test for $name', () {
      final unary = unaryStub<Future<T>, S>();
      RunUnaryAsync<T, S> buildTester() => runUnaryAsync(unary.wrap);

      test(
          'GIVEN $name original function does not throw '
          'WHEN $name.call '
          'THEN return Success', () async {
        unary
          ..reset
          ..stub = example;

        final tester = buildTester();
        final result = await tester(seed());

        expect(
          result,
          isA<Success<T>>(),
          reason: 'tester should not throw',
        );
      });
      test(
          'GIVEN $name original function throws Exception '
          'WHEN $name.call '
          'THEN return Failure', () async {
        unary
          ..reset
          ..stub = (_) => throw Exception();

        final tester = buildTester();
        final result = await tester(seed());

        expect(
          result,
          isA<Failure<T>>(),
          reason: 'tester should throw',
        );
      });

      test(
          'GIVEN $name original function throws Error '
          'WHEN $name.call '
          'THEN return Failure', () async {
        unary
          ..reset
          ..stub = (_) => throw Error();

        final tester = buildTester();
        final result = await tester(seed());

        expect(
          result,
          isA<Failure<T>>(),
          reason: 'tester should throw',
        );
      });
    });
  }
}
