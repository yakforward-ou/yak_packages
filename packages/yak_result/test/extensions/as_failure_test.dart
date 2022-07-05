import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';

void main() {
  group('ResultAsFailureX', () {
    test('GIVEN Result is a Failure' 'WHEN failure ' 'THEN return a Failure',
        () {
      final res = Failure();

      expect(
        res.failure,
        isA<Failure>(),
        reason: 'should be a failure',
      );
    });
    test('GIVEN Result is a Success' 'WHEN failure ' 'THEN should throw', () {
      final res = Success(Null);

      expect(
        () => res.failure,
        throwsA(isA<AssertionError>()),
        reason: 'should throw',
      );
    });
  });
}
