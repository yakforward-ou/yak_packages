import 'dart:ui';

import 'package:test/test.dart';
import 'package:yak_tween/yak_tween.dart';

void main() {
  const a = Radius.circular(42);
  const b = Radius.circular(13);
  group('lerp_int TEST', () {
    test('GIVEN `t` == 1 ' 'WHEN radiusNNLerp(a,b,t) ' 'THEN returns b', () {
      const t = 1.0;
      expect(
        radiusNNLerp(a, b, t),
        b,
        reason: 'should return `b`',
      );
    });
    test('GIVEN `t` == 0 ' 'WHEN radiusNNLerp(a,b,t) ' 'THEN returns a', () {
      const t = .0;
      expect(
        radiusNNLerp(a, b, t),
        a,
        reason: 'should return `a`',
      );
    });
    test(
        'GIVEN `t` > 0 < 1 '
        'WHEN radiusNNLerp(a,b,t) '
        'THEN returns between a and b', () {
      const t = .5;
      final r = radiusNNLerp(a, b, t);
      expect(
        ((r.x < b.x && r.x > a.x) ||
            (r.x < a.x && r.x > b.x) && (r.y < b.y && r.y > a.y) ||
            (r.y < a.y && r.y > b.y)),
        isTrue,
        reason: 'should return `between `a` and `b`',
      );
    });
  });
}
