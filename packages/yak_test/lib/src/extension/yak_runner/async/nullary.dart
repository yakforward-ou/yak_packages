import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
// coverage:ignore-file

/// a `typedef` for a `ResultNullary` test function
typedef ResultNullaryAsyncTest<T> = void Function({
  String name,
  NullaryAsync<T> example,
});

/// an `extension` that generates a basic set of tests for `ResultNullaryAsync`
extension ResultNullaryAsyncTestX<T> on ResultNullaryAsync<T> {
  /// run `test` providing a `description` and an `example` function
  void tester({
    required String name,
    required NullaryAsync<T> example,
  }) {
    group('test for $name', () {
      final tester = Stub.nullary<Future<T>>();

      setUp(tester.reset);

      test(
          'GIVEN $name original function does not throw '
          'WHEN $name.call '
          'THEN return Success', () {
        tester.stub = example;

        expectLater(
          tester(),
          isA<Success<T>>(),
          reason: 'tester should not throw',
        );
      });

      test(
          'GIVEN $name original function throws Exception '
          'WHEN $name.call '
          'THEN return Failure', () {
        tester.stub = () => throw Exception();

        expect(
          tester(),
          isA<Failure<T>>(),
          reason: 'tester should throw',
        );
      });

      test(
          'GIVEN $name original function throws Error '
          'WHEN $name.call '
          'THEN return Failure', () {
        tester.stub = () => throw Error();

        expect(
          tester(),
          isA<Failure<T>>(),
          reason: 'tester should throw',
        );
      });
    });
  }
}
