import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';
import 'package:yak_runner/yak_runner.dart';
// coverage:ignore-file

/// a `typedef` for a `RunNullarySync` test function
typedef RunNullaryAsyncTest<T> = void Function({
  String name,
  NullaryAsync<T> example,
});

/// an `extension` that generates a basic set of tests for `RunNullaryAsync`
extension RunNullaryAsyncTestX<T> on RunNullaryAsync<T> {
  /// run `test` providing a `description` and an `example` function
  void tester({
    required String name,
    required NullaryAsync<T> example,
  }) {
    group('test for $name', () {
      final nullary = nullaryStub<Future<T>>();
      RunNullaryAsync<T> buildTester() => runNullaryAsync(nullary.wrap);

      test(
          'GIVEN $name original function does not throw '
          'WHEN $name.call '
          'THEN return Success', () async {
        nullary
          ..reset
          ..stub = example;

        final tester = buildTester();
        final result = await tester();

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
        nullary
          ..reset
          ..stub = () => throw Exception();

        final tester = buildTester();
        final result = await tester();

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
        nullary
          ..reset
          ..stub = () => throw Error();

        final tester = buildTester();
        final result = await tester();

        expect(
          result,
          isA<Failure<T>>(),
          reason: 'tester should throw',
        );
      });
    });
  }
}
