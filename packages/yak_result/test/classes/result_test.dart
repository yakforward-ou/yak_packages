import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';

void main() {
  group('Result', () {
    group('Success Type maching', () {
      final tester = Stub.nullary<Result<bool>>();
      final negative = Stub.nullary<Result<int>>();

      setUp(() {
        tester.reset();
        negative.reset();
      });

      test(
          'GIVEN Success<T> '
          'WHEN this is Result<T> '
          'THEN return true', () {
        tester.stub = () => Success(false);

        expect(
          tester(),
          isA<Result<bool>>(),
          reason: 'type should be predictable',
        );
      });

      test(
          'GIVEN Success<S> '
          'WHEN this is Result<T> '
          'THEN return false', () {
        negative.stub = () => Success(0);

        expect(
          negative(),
          isNot(isA<Result<bool>>()),
          reason: 'type should be predictable',
        );
      });

      test(
          'GIVEN Success<T> and Success<S> '
          'WHEN this is Result '
          'THEN return true', () {
        tester.stub = () => Success(false);
        negative.stub = () => Success(0);

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
    group('Failure Type maching', () {
      final tester = Stub.nullary<Result<bool>>();
      final negative = Stub.nullary<Result<int>>();

      setUp(() {
        tester.reset();
        negative.reset();
      });

      test(
          'GIVEN Failure<T> '
          'WHEN this is Result<T> '
          'THEN return true', () {
        tester.stub = () => Failure();

        expect(
          tester(),
          isA<Result<bool>>(),
          reason: 'type should be predictable',
        );
      });

      test(
          'GIVEN Success<S> '
          'WHEN this is Result<T> '
          'THEN return false', () {
        negative.stub = () => Failure();

        expect(
          negative(),
          isNot(isA<Result<bool>>()),
          reason: 'type should be predictable',
        );
      });
      test(
          'GIVEN Success<T> and Success<S> '
          'WHEN this is Result '
          'THEN return true', () {
        tester.stub = () => Failure();
        negative.stub = () => Failure();

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
  });
  group('ValueResult', () {
    group('ValueResult Type maching', () {
      final tester = Stub.nullary<Result>();
      final negative = Stub.nullary<Result>();
      final strict = Stub.nullary<ValueResult>();

      setUp(() {
        tester.reset();
        negative.reset();
        strict.reset();
      });

      test(
          'GIVEN Result<T>() '
          'WHEN this is ValueResult '
          'THEN return true', () {
        tester.stub = () => Success(0);

        expect(
          tester(),
          isA<ValueResult>(),
          reason: 'type should be predictable',
        );
      });

      test(
          'GIVEN VoidSuccess '
          'WHEN this is ValueResult '
          'THEN return false', () {
        negative.stub = () => VoidSuccess();

        expect(
          negative(),
          isNot(isA<ValueResult>()),
          reason: 'type should be predictable',
        );
      });

      test(
          'GIVEN ValueSuccess '
          'WHEN this is Result '
          'THEN return true', () {
        strict.stub = () => ValueSuccess(0);

        expect(
          strict(),
          isA<Result>(),
          reason: 'type should be predictable',
        );
      });
    });
  });

  group('VoidResult', () {
    group('VoidResult Type maching', () {
      final tester = Stub.nullary<Result>();
      final negative = Stub.nullary<Result>();
      final strict = Stub.nullary<VoidResult>();

      setUp(() {
        tester.reset();
        negative.reset();
        strict.reset();
      });

      test(
          'GIVEN VoidSuccess() '
          'WHEN this is VoidResult '
          'THEN return true', () {
        tester.stub = () => VoidSuccess();

        expect(
          tester(),
          isA<VoidSuccess>(),
          reason: 'type should be predictable',
        );
      });

      test(
          'GIVEN ValueSuccess '
          'WHEN this is VoidResult '
          'THEN return false', () {
        negative.stub = () => Success(0);

        expect(
          negative(),
          isNot(isA<VoidResult>()),
          reason: 'type should be predictable',
        );
      });

      test(
          'GIVEN VoidResult '
          'WHEN this is Result '
          'THEN return false', () {
        strict.stub = () => VoidSuccess();

        expect(
          strict(),
          isA<Result>(),
          reason: 'type should be predictable',
        );
      });
    });
  });
}
