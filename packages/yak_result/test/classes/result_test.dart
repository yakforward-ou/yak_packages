import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';
// ignore_for_file: unrelated_type_equality_checks

void main() {
  group('Result', () {
    group('deep equality', () {
      test(
          'GIVEN Result of Type `T`'
          'WHEN this == Result<S> '
          'THEN return false', () {
        const Result<bool> res1 = Success(false);

        expect(
          res1,
          isA<Result<bool>>(),
          reason: 'type should be predictable',
        );

        const Result<int> res2 = Success(0);

        expect(
          res2,
          isA<Result<int>>(),
          reason: 'type should be predictable',
        );

        expect(
          res1 == res2,
          isFalse,
          reason: 'equality should return false',
        );
      });
      test(
          'GIVEN Result of Type `T`'
          'WHEN this == Result<T> '
          'THEN return true', () {
        final Result<bool> res1 = Success(false);

        expect(
          res1,
          isA<Result<bool>>(),
          reason: 'type should be predictable',
        );

        const Result<bool> res2 = Success(false);

        expect(
          res2,
          isA<Result<bool>>(),
          reason: 'type should be predictable',
        );

        expect(
          res1 == res2,
          isTrue,
          reason: 'equality should return true',
        );
      });
    });
  });
}
