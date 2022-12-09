import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';
import 'package:stub/stub.dart';

void main() {
  group('ResultAsFailureX', () {
    group('"failure"', () {
      final tester = Stub.nullary<Result>();

      setUp(tester.reset);
      test('GIVEN Result is a Failure ' 'WHEN failure ' 'THEN return a Failure',
          () {
        tester.stub = () => Failure();

        expect(
          tester().failure,
          isA<Failure>(),
          reason: 'should be a failure',
        );
      });
      test('GIVEN Result is a Success ' 'WHEN failure ' 'THEN should throw',
          () {
        tester.stub = () => Success();

        expect(
          () => tester().failure,
          throwsA(isA<Exception>()),
          reason: 'should throw',
        );
      });
    });
    group('"failureOrNull"', () {
      group('"Result" - "Success" - "Failure"', () {
        final tester = Stub.nullary<Result>();

        setUp(tester.reset);
        test(
            'GIVEN Result is a Failure '
            'WHEN failure '
            'THEN return a Failure', () {
          tester.stub = () => Failure();

          expect(
            tester().failureOrNull,
            isA<Failure>(),
            reason: 'should be a failure',
          );
        });
        test('GIVEN Result is a Success ' 'WHEN failure ' 'THEN should be null',
            () {
          tester.stub = () => Success();

          expect(
            tester().failureOrNull,
            isNull,
            reason: 'should be null',
          );
        });
      });
      group('Void', () {
        final tester = Stub.nullary<VoidResult>();

        setUp(tester.reset);
        test(
            'GIVEN Result is a Failure '
            'WHEN failure '
            'THEN return a Failure', () {
          tester.stub = () => Failure();

          expect(
            tester().failureOrNull,
            isA<Failure>(),
            reason: 'should be a failure',
          );
        });
        test('GIVEN Result is a Success ' 'WHEN failure ' 'THEN should be null',
            () {
          tester.stub = () => VoidSuccess();

          expect(
            tester().failureOrNull,
            isNull,
            reason: 'should be null',
          );
        });
      });
      group('Value', () {
        final tester = Stub.nullary<ValueResult>();

        setUp(tester.reset);
        test(
            'GIVEN Result is a Failure '
            'WHEN failure '
            'THEN return a Failure', () {
          tester.stub = () => Failure();

          expect(
            tester().failureOrNull,
            isA<Failure>(),
            reason: 'should be a failure',
          );
        });
        test('GIVEN Result is a Success ' 'WHEN failure ' 'THEN should be null',
            () {
          tester.stub = () => ValueSuccess(0);

          expect(
            tester().failureOrNull,
            isNull,
            reason: 'should be null',
          );
        });
      });
    });
  });
}
