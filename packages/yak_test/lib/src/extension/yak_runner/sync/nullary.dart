import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
// coverage:ignore-file

/// a `typedef` for a `ResultNullary` test function
typedef ResultNullaryTest<T> = void Function({
  required String name,
  required Nullary<T> example,
});

/// an `extension` that generates a basic set of tests for `ResultNullary`
extension ResultNullaryTestX<T extends Object> on ResultNullary<T> {
  /// run `test` providing a `description` and an `example` function
  void tester({
    required String name,
    required Nullary<T> example,
  }) {
    group('test for $name', () {
      final tester = Stub.nullary<T>();

      setUp(tester.reset);

      test(
          'GIVEN $name original function does not throw '
          'WHEN $name.call '
          'THEN return Success', () {
        tester.stub = example;

        final result = tester();

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
        tester.stub = () => throw Exception();

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
        tester.stub = () => throw Error();

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
