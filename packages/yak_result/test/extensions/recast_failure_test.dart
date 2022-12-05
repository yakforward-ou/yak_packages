import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';

void main() {
  group('RecastFailureX', () {
    test('GIVEN Failure<S> ' 'WHEN recast<T>() ' 'THEN return Failure<T>', () {
      final tester = Failure<String>();

      expect(
        tester.recast<int>(),
        isA<Failure<int>>(),
        reason: 'should be recasted',
      );
      expect(
        tester.recast<int>(),
        isA<Result<int>>(),
        reason: 'should be recasted',
      );
    });
  });
}
