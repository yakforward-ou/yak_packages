import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';
import 'package:stub/stub.dart';

void main() {
  group('ValueResultAsSuccess', () {
    group('"success"', () {
      final tester = Stub.nullary<ValueResult>();

      setUp(tester.reset);
      test('GIVEN Result is a Failure ' 'WHEN failure ' 'THEN should throw',
          () {
        tester.stub = () => Failure();

        expect(
          () => tester().success,
          throwsA(isA<Exception>()),
          reason: 'should throw',
        );
      });
      test('GIVEN Result is a Success ' 'WHEN failure ' 'THEN should throw',
          () {
        tester.stub = () => Success.value(0);

        expect(
          tester().success,
          isA<Success>(),
          reason: 'should be a Success',
        );
      });
    });
    group('"successOrNull"', () {
      final tester = Stub.nullary<ValueResult>();

      setUp(tester.reset);
      test(
          'GIVEN Result is a Failure '
          'WHEN failure '
          'THEN return a Failure', () {
        tester.stub = () => Failure();

        expect(
          tester().successOrNull,
          isNull,
          reason: 'should be null',
        );
      });
      test('GIVEN Result is a Success ' 'WHEN failure ' 'THEN should be null',
          () {
        tester.stub = () => Success.value(0);

        expect(
          tester().successOrNull,
          isA<Success>(),
          reason: 'should be a Success',
        );
      });
    });
  });

  group('VoidResultAsSuccess', () {
    group('"success"', () {
      final tester = Stub.nullary<VoidResult>();

      setUp(tester.reset);
      test('GIVEN Result is a Failure ' 'WHEN failure ' 'THEN should throw',
          () {
        tester.stub = () => Failure();

        expect(
          () => tester().success,
          throwsA(isA<Exception>()),
          reason: 'should throw',
        );
      });
      test('GIVEN Result is a Success ' 'WHEN failure ' 'THEN should throw',
          () {
        tester.stub = () => VoidSuccess();

        expect(
          tester().success,
          isA<Success>(),
          reason: 'should be a Success',
        );
      });
    });
    group('"successOrNull"', () {
      final tester = Stub.nullary<VoidResult>();

      setUp(tester.reset);
      test(
          'GIVEN Result is a Failure '
          'WHEN failure '
          'THEN return a Failure', () {
        tester.stub = () => Failure();

        expect(
          tester().successOrNull,
          isNull,
          reason: 'should be null',
        );
      });
      test('GIVEN Result is a Success ' 'WHEN failure ' 'THEN should be null',
          () {
        tester.stub = () => VoidSuccess();

        expect(
          tester().successOrNull,
          isA<Success>(),
          reason: 'should be a Success',
        );
      });
    });
  });
}
