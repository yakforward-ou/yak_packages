import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';

void main() {
  group('Result', () {
    group('IsValueSuccessX', () {
      final tester = Stub.nullary<Result>();

      setUp(tester.reset);
      test('GIVEN Result is Success ' 'WHEN .isSuccess ' 'THEN returns true',
          () {
        tester.stub = () => Success(true);
        expect(
          tester().isSuccess,
          isTrue,
          reason: 'should return true',
        );
      });
      test('GIVEN Result is Failure ' 'WHEN .isSuccess ' 'THEN returns false',
          () {
        tester.stub = () => Failure();
        expect(
          tester().isSuccess,
          isFalse,
          reason: 'should return false',
        );
      });
    });

    group('IsVoidSuccessX', () {
      final tester = Stub.nullary<Result>();

      setUp(tester.reset);
      test('GIVEN Result is Success ' 'WHEN .isSuccess ' 'THEN returns true',
          () {
        tester.stub = () => Success(true);
        expect(
          tester().isSuccess,
          isTrue,
          reason: 'should return true',
        );
      });
      test('GIVEN Result is Failure ' 'WHEN .isSuccess ' 'THEN returns false',
          () {
        tester.stub = () => Failure();
        expect(
          tester().isSuccess,
          isFalse,
          reason: 'should return false',
        );
      });
    });
    group('IsFailureX', () {
      final tester = Stub.nullary<Result>();

      setUp(tester.reset);
      test('GIVEN Result is Success ' 'WHEN .isFailure ' 'THEN returns false',
          () {
        tester.stub = () => Success(true);
        expect(
          tester().isFailure,
          isFalse,
          reason: 'should return false',
        );
      });
      test('GIVEN Result is Failure ' 'WHEN .isfailure ' 'THEN returns true',
          () {
        tester.stub = () => Failure();
        expect(
          tester().isFailure,
          isTrue,
          reason: 'should return true',
        );
      });
    });
  });
  group('VoidResult', () {
    group('IsValueSuccessX', () {
      final tester = Stub.nullary<Result>();

      setUp(tester.reset);
      test('GIVEN Result is Success ' 'WHEN .isSuccess ' 'THEN returns true',
          () {
        tester.stub = () => VoidSuccess();
        expect(
          tester().isSuccess,
          isTrue,
          reason: 'should return true',
        );
      });
      test('GIVEN Result is Failure ' 'WHEN .isSuccess ' 'THEN returns false',
          () {
        tester.stub = () => Failure();
        expect(
          tester().isSuccess,
          isFalse,
          reason: 'should return false',
        );
      });
    });

    group('IsVoidSuccessX', () {
      final tester = Stub.nullary<Result>();

      setUp(tester.reset);
      test('GIVEN Result is Success ' 'WHEN .isSuccess ' 'THEN returns true',
          () {
        tester.stub = () => VoidSuccess();
        expect(
          tester().isSuccess,
          isTrue,
          reason: 'should return true',
        );
      });
      test('GIVEN Result is Failure ' 'WHEN .isSuccess ' 'THEN returns false',
          () {
        tester.stub = () => Failure();
        expect(
          tester().isSuccess,
          isFalse,
          reason: 'should return false',
        );
      });
    });
    group('IsFailureX', () {
      final tester = Stub.nullary<Result>();

      setUp(tester.reset);
      test('GIVEN Result is Success ' 'WHEN .isFailure ' 'THEN returns false',
          () {
        tester.stub = () => VoidSuccess();
        expect(
          tester().isFailure,
          isFalse,
          reason: 'should return false',
        );
      });
      test('GIVEN Result is Failure ' 'WHEN .isfailure ' 'THEN returns true',
          () {
        tester.stub = () => Failure();
        expect(
          tester().isFailure,
          isTrue,
          reason: 'should return true',
        );
      });
    });
  });
}
