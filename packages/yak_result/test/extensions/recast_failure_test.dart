import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';

void main() {
  group('RecastFailureX', () {
    test('GIVEN Failure<S>' 'WHEN recast<T>() ' 'THEN return Failure<T>', () {
      const failure = Failure<String>();

      expect(
        failure.recast<int>(),
        isA<Failure<int>>(),
        reason: 'should be recaster',
      );
    });
  });
}
