import 'package:test/test.dart';
import 'package:yak_utils/yak_utils.dart';

void main() {
  const a = 42;
  const b = 13;
  group('lerp_int TEST', () {
    test('GIVEN `t` == 1 ' 'WHEN lerpNNDouble(a,b,t) ' 'THEN returns b', () {
      const t = 1.0;
      expect(
        lerpInt(a, b, t),
        b,
        reason: 'should return `b`',
      );
    });
    test('GIVEN `t` == 0 ' 'WHEN lerpNNDouble(a,b,t) ' 'THEN returns a', () {
      const t = .0;
      expect(
        lerpInt(a, b, t),
        a,
        reason: 'should return `a`',
      );
    });
    test(
        'GIVEN `t` > 0 < 1 '
        'WHEN lerpNNDouble(a,b,t) '
        'THEN returns between a and b', () {
      const t = .5;
      final r = lerpInt(a, b, t);
      expect(
        (r < b && r > a) || (r < a && r > b),
        isTrue,
        reason: 'should return `between `a` and `b`',
      );
    });
  });
}
