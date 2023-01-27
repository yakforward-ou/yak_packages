import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';

void main() {
  group('Success', () {
    group('Success Type maching', () {
      final tester = Stub.nullary<Success<bool>>();
      final negative = Stub.nullary<Success<int>>();

      setUp(() {
        tester.reset();
        negative.reset();
      });

      test(
          'GIVEN Success<T> '
          'WHEN this is Success<T> '
          'THEN return true', () {
        tester.stub = () => Success.value(false);

        expect(
          tester(),
          isA<Success<bool>>(),
          reason: 'type should be predictable',
        );
      });

      test(
          'GIVEN Success<S> '
          'WHEN this is Success<T> '
          'THEN return false', () {
        negative.stub = () => Success.value(0);

        expect(
          negative(),
          isNot(isA<Success<bool>>()),
          reason: 'type should be predictable',
        );
      });

      test(
          'GIVEN Success<T> and Success<S> '
          'WHEN this is Success '
          'THEN return true', () {
        tester.stub = () => Success.value(false);
        negative.stub = () => Success.value(0);

        expect(
          tester(),
          isA<Result>(),
          reason: 'type should be predictable',
        );
        expect(
          negative(),
          isA<Result>(),
          reason: 'type should be predictable',
        );
      });
    });
    group('equality VS different Type', () {
      final tester = Stub.nullary<Success<bool>>();
      final negative = Stub.nullary<Success<int>>();

      setUp(() {
        tester.reset();
        negative.reset();
      });

      test(
          'GIVEN Success of Type `T`'
          'WHEN this == Success<T> '
          'THEN return true', () {
        tester.stub = () => Success.value(true);
        negative.stub = () => Success.value(0);

        expect(
          tester(),
          isNot(equals(negative())),
          reason: 'type should be predictable',
        );
      });
    });
    group('equality VS different value', () {
      final tester = Stub.nullary<Success<bool>>();
      final negative = Stub.nullary<Success<bool>>();

      setUp(() {
        tester.reset();
        negative.reset();
      });

      test(
          'GIVEN Success of Type `T`'
          'WHEN this == Success<T> & holds the same data '
          'THEN return true', () {
        tester.stub = () => Success.value(true);
        negative.stub = () => Success.value(true);

        expect(
          tester(),
          equals(negative()),
          reason: 'equality should return true',
        );
      });

      test(
          'GIVEN Success of Type `T`'
          'WHEN this == Success<T> & holds different data '
          'THEN return true', () {
        tester.stub = () => Success.value(true);
        negative.stub = () => Success.value(false);

        expect(
          tester(),
          isNot(equals(negative())),
          reason: 'equality should return true',
        );
      });
    });
  });
  group('ValueSuccess', () {
    group('ValueSuccess Type maching', () {
      final tester = Stub.nullary<Success>();
      final negative = Stub.nullary<Success>();
      final strict = Stub.nullary<ValueSuccess>();

      setUp(() {
        tester.reset();
        negative.reset();
        strict.reset();
      });

      test(
          'GIVEN Success<T>() '
          'WHEN this is ValueSuccess '
          'THEN return true', () {
        tester.stub = () => Success.value(0);

        expect(
          tester(),
          isA<ValueSuccess>(),
          reason: 'type should be predictable',
        );
      });

      test(
          'GIVEN VoidSuccess '
          'WHEN this is ValueSuccess '
          'THEN return false', () {
        negative.stub = () => Success.empty;

        expect(
          negative(),
          isNot(isA<ValueSuccess>()),
          reason: 'type should be predictable',
        );
      });

      test(
          'GIVEN ValueSuccess '
          'WHEN this is Success '
          'THEN return true', () {
        strict.stub = () => Success.value(null);

        expect(
          strict(),
          isA<Success>(),
          reason: 'type should be predictable',
        );
      });
      test(
          'GIVEN ValueSuccess '
          'WHEN this is Result '
          'THEN return true', () {
        strict.stub = () => Success.value(null);

        expect(
          strict(),
          isA<Result>(),
          reason: 'type should be predictable',
        );
      });
    });

    group('VoidSuccess', () {
      group('VoidSuccess Type maching', () {
        final tester = Stub.nullary<Success>();
        final negative = Stub.nullary<Success>();
        final strict = Stub.nullary<VoidSuccess>();

        setUp(() {
          tester.reset();
          negative.reset();
          strict.reset();
        });

        test(
            'GIVEN VoidSuccess() '
            'WHEN this is VoidSuccess '
            'THEN return true', () {
          tester.stub = () => Success.empty;

          expect(
            tester(),
            isA<VoidSuccess>(),
            reason: 'type should be predictable',
          );
        });

        test(
            'GIVEN ValueSuccess '
            'WHEN this is VoidSuccess '
            'THEN return false', () {
          negative.stub = () => Success.value(0);

          expect(
            negative(),
            isNot(isA<VoidSuccess>()),
            reason: 'type should be predictable',
          );
        });

        test(
            'GIVEN ValueSuccess '
            'WHEN this is Success '
            'THEN return false', () {
          strict.stub = () => Success.empty;

          expect(
            strict(),
            isA<Success>(),
            reason: 'type should be predictable',
          );
        });
        test(
            'GIVEN ValueSuccess '
            'WHEN this is Result '
            'THEN return false', () {
          strict.stub = () => Success.empty;

          expect(
            strict(),
            isA<Result>(),
            reason: 'type should be predictable',
          );
        });
      });
    });
  });
}
