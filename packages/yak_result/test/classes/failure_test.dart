import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';
// ignore_for_file: unrelated_type_equality_checks

void main() {
  group('Failure', () {
    group('deep equality', () {
      test(
          'GIVEN Failure of Type `T`'
          'WHEN this == Failure<S> '
          'THEN return false', () {
        final res1 = Failure<bool>();

        expect(
          res1,
          isA<Failure<bool>>(),
          reason: 'type should be predictable',
        );

        final res2 = Failure<int>();

        expect(
          res2,
          isA<Failure<int>>(),
          reason: 'type should be predictable',
        );

        expect(
          res1 == res2,
          isFalse,
          reason: 'equality should return false',
        );
      });
      test(
          'GIVEN Failure of Type `T`'
          'WHEN this == Failure<T> & holds the same arguments '
          'THEN return true', () {
        final res1 = Failure<bool>();

        expect(
          res1,
          isA<Failure<bool>>(),
          reason: 'type should be predictable',
        );

        final res2 = Failure<bool>();

        expect(
          res2,
          isA<Failure<bool>>(),
          reason: 'type should be predictable',
        );

        expect(
          res1 == res2,
          isTrue,
          reason: 'equality should return true',
        );
      });

      test(
          'GIVEN Failure of Type `T`'
          'WHEN this == Failure<T> & holds different arguments '
          'THEN return false', () {
        final res1 = Failure<bool>();

        expect(
          res1,
          isA<Failure<bool>>(),
          reason: 'type should be predictable',
        );

        final res2 = Failure<bool>(reason: '');

        expect(
          res2,
          isA<Failure<bool>>(),
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
