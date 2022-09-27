import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:yak_result/yak_result.dart';

void main() {
  const success = Success(null);
  final failure = Failure();
  const pending = Pending();
  group('IsSuccessX', () {
    test('GIVEN Result is Success ' 'WHEN .isSuccess ' 'THEN returns true', () {
      final Result tester = success;
      expect(
        tester.isSuccess,
        isTrue,
        reason: 'should return true',
      );
    });
    test('GIVEN Result is Failure ' 'WHEN .isSuccess ' 'THEN returns false',
        () {
      final Result tester = failure;
      expect(
        tester.isSuccess,
        isFalse,
        reason: 'should return false',
      );
    });
    test('GIVEN Result is Pending ' 'WHEN .isSuccess ' 'THEN returns false',
        () {
      final Result tester = pending;
      expect(
        tester.isSuccess,
        isFalse,
        reason: 'should return false',
      );
    });
  });
  group('IsFailureX', () {
    test('GIVEN Result is Success ' 'WHEN .isFailure ' 'THEN returns false',
        () {
      final Result tester = success;
      expect(
        tester.isFailure,
        isFalse,
        reason: 'should return false',
      );
    });
    test('GIVEN Result is Failure ' 'WHEN .isSuccess ' 'THEN returns true', () {
      final Result tester = failure;
      expect(
        tester.isFailure,
        isTrue,
        reason: 'should return true',
      );
    });
    test('GIVEN Result is Pending ' 'WHEN .isSuccess ' 'THEN returns false',
        () {
      final Result tester = pending;
      expect(
        tester.isFailure,
        isFalse,
        reason: 'should return false',
      );
    });
  });

  group('IsPendingX', () {
    test('GIVEN Result is Success ' 'WHEN .isPending ' 'THEN returns false',
        () {
      final Result tester = success;
      expect(
        tester.isPending,
        isFalse,
        reason: 'should return false',
      );
    });
    test('GIVEN Result is Failure ' 'WHEN .isPending ' 'THEN returns false',
        () {
      final Result tester = failure;
      expect(
        tester.isPending,
        isFalse,
        reason: 'should return false',
      );
    });
    test('GIVEN Result is Pending ' 'WHEN .isPending ' 'THEN returns true', () {
      final Result tester = pending;
      expect(
        tester.isPending,
        isTrue,
        reason: 'should return true',
      );
    });
  });
}
