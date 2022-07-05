import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';
import 'package:yak_runner/yak_runner.dart';
// coverage:ignore-file

/// a `typedef` for a `RunNullarySync` test function
typedef RunNullarySyncTest<T> = void Function({
  String name,
  Nullary<T> example,
});

/// an `extension` that generates a basic set of tests for `RunNullarySync`
extension RunNullarySyncTestX<T> on RunNullarySync<T> {
  /// run `test` providing a `description` and an `example` function
  void tester({
    required String name,
    required Nullary<T> example,
  }) {
    group('test for $name', () {
      final nullary = nullaryStub<T>();
      RunNullarySync<T> buildTester() => runNullarySync(nullary.wrap);

      test(
          'GIVEN $name original function does not throw '
          'WHEN $name.call '
          'THEN return Success', () {
        nullary
          ..reset
          ..stub = example;

        final tester = buildTester();
        final result = tester();

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
        nullary
          ..reset
          ..stub = () => throw Exception();

        final tester = buildTester();
        final result = tester();

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
        nullary
          ..reset
          ..stub = () => throw Error();

        final tester = buildTester();
        final result = tester();

        expect(
          result,
          isA<Failure<T>>(),
          reason: 'tester should throw',
        );
      });
    });
  }
}
