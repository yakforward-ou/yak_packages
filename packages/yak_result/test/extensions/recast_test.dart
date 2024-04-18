import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';

void main() {
  const reason = 0;
  final stackTrace = StackTrace.fromString('stackTraceString');
  final failure = Failure<int>(reason, stackTrace);
  group('Failure recast() Test ', () {
    test(
        'GIVEN Failure<T> '
        'WHEN recast<S>() '
        'THEN return a Failure<S>', () {
      expect(
        failure.recast<String>(),
        isA<Failure<String>>(),
        reason: 'should be a Failure of the exact type',
      );
    });
    test(
        'GIVEN Failure<T> '
        'WHEN recast<S>() '
        'THEN return a Failure with same reason', () {
      expect(
        failure.recast<String>().asFailure.reason,
        equals(reason),
        reason: 'reason should match',
      );
    });
    test(
        'GIVEN Failure<T> '
        'WHEN recast<S>() '
        'THEN return a Failure with same stacktrace', () {
      expect(
        failure.recast<String>().asFailure.stackTrace,
        equals(stackTrace),
        reason: 'stackTrace should match',
      );
    });
  });

  group('Failure asVoid() Test ', () {
    test(
        'GIVEN Failure<T> '
        'WHEN asVoid() '
        'THEN return a Failure<void>', () {
      expect(
        failure.asVoid(),
        isA<Failure<void>>(),
        reason: 'should be a Failure of the exact type',
      );
    });
    test(
        'GIVEN Failure<T> '
        'WHEN asVoid() '
        'THEN return a VoidResult', () {
      expect(
        failure.asVoid(),
        isA<VoidResult>(),
        reason: 'should be a Failure of the exact type',
      );
    });
    test(
        'GIVEN Failure<T> '
        'WHEN asVoid() '
        'THEN return a Failure with same reason', () {
      expect(
        failure.asVoid().asFailure.reason,
        equals(reason),
        reason: 'reason should match',
      );
    });
    test(
        'GIVEN Failure<T> '
        'WHEN asVoid() '
        'THEN return a Failure with same stacktrace', () {
      expect(
        failure.asVoid().asFailure.stackTrace,
        equals(stackTrace),
        reason: 'stackTrace should match',
      );
    });
  });

  group('Result asVoid() Test ', () {
    test(
        'GIVEN Result<T> '
        'WHEN asVoid() '
        'THEN return a VoidResult', () {
      final result = const Result.success(true);

      expect(
        result.asVoid(),
        isA<VoidResult>(),
        reason: 'should be a Failure of the exact type',
      );
    });

    test(
        'GIVEN Result<T>.failure '
        'WHEN asVoid() '
        'THEN return a Failure with same reason', () {
      final result = Result<bool>.failure(reason, stackTrace);

      expect(
        result.asVoid().asFailure.reason,
        equals(reason),
        reason: 'reason should match',
      );
    });
    test(
        'GIVEN  Result<T>.failure '
        'WHEN recast<S>() '
        'THEN return a Failure with same stacktrace', () {
      final result = Result<bool>.failure(reason, stackTrace);

      expect(
        result.asVoid().asFailure.stackTrace,
        equals(stackTrace),
        reason: 'stackTrace should match',
      );
    });
  });
}
