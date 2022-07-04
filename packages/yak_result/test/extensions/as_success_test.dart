import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';

void main() {
  group('ResultAsSuccessX', () {
    test('GIVEN Result is a Success' 'WHEN success ' 'THEN return a data', () {
      final res = Success(true);

      expect(
        res.success,
        isTrue,
        reason: 'should be data',
      );
    });
    test('GIVEN Result is a Success' 'WHEN failure ' 'THEN should throw', () {
      final res = Failure();

      expect(
        () => res.success,
        throwsA(isA<AssertionError>()),
        reason: 'should throw',
      );
    });
  });
}
