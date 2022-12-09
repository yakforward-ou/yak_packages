import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';

void main() {
  group('ResultAsFailureX', () {
    const reason = 0;
    final stackTrace = StackTrace.fromString('stackTraceString');
    final failure = Failure<int>(reason, stackTrace);
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
        failure.recast<String>().reason,
        equals(reason),
        reason: 'reason should match',
      );
    });
    test(
        'GIVEN Failure<T> '
        'WHEN recast<S>() '
        'THEN return a Failure with same stacktrace', () {
      expect(
        failure.recast<String>().stackTrace,
        equals(stackTrace),
        reason: 'stackTrace should match',
      );
    });
  });
}
