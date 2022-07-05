import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';
// ignore_for_file: unrelated_type_equality_checks

void main() {
  group('Success', () {
    group('deep equality', () {
      test(
          'GIVEN Success of Type `T`'
          'WHEN this == Success<S> '
          'THEN return false', () {
        const res1 = Success(false);

        expect(
          res1,
          isA<Success<bool>>(),
          reason: 'type should be predictable',
        );

        const res2 = Success(0);

        expect(
          res2,
          isA<Success<int>>(),
          reason: 'type should be predictable',
        );

        expect(
          res1 == res2,
          isFalse,
          reason: 'equality should return false',
        );
      });
      test(
          'GIVEN Success of Type `T`'
          'WHEN this == Success<T> & holds the same data '
          'THEN return true', () {
        const res1 = Success(false);

        expect(
          res1,
          isA<Success<bool>>(),
          reason: 'type should be predictable',
        );

        const res2 = Success(false);

        expect(
          res2,
          isA<Success<bool>>(),
          reason: 'type should be predictable',
        );

        expect(
          res1 == res2,
          isTrue,
          reason: 'equality should return true',
        );
      });

      test(
          'GIVEN Success of Type `T`'
          'WHEN this == Success<T> & holds different data '
          'THEN return false', () {
        const res1 = Success(false);

        expect(
          res1,
          isA<Success<bool>>(),
          reason: 'type should be predictable',
        );

        const res2 = Success(true);

        expect(
          res2,
          isA<Success<bool>>(),
          reason: 'type should be predictable',
        );

        expect(
          res1 == res2,
          isFalse,
          reason: 'equality should return false',
        );
      });
    });
  });
}
