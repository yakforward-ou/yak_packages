import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';
// ignore_for_file: unrelated_type_equality_checks

void main() {
  group('Pending', () {
    group('deep equality', () {
      test(
          'GIVEN Pending of Type `T`'
          'WHEN this == Pending<S> '
          'THEN return false', () {
        const Pending<bool> res1 = Pending();

        expect(
          res1,
          isA<Result<bool>>(),
          reason: 'type should be predictable',
        );

        const Result<int> res2 = Pending();

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
        final Result<bool> res1 = Pending();

        expect(
          res1,
          isA<Result<bool>>(),
          reason: 'type should be predictable',
        );

        const Result<bool> res2 = Pending();

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
