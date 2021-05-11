import 'package:test/test.dart';
import 'package:yak_utils/yak_utils.dart';

// /// see `sky_engine/lib/ui/lerp.dart`
// int clampInt(int value, int min, int max) {
//   assert(min <= max);
//   return value < min
//       ? min
//       : value > max
//           ? max
//           : value;
// }

void main() {
  const min = 2;
  const max = 13;

  group('clampInt TEST', () {
    test(
        'GIVEN  value > max '
        'WHEN clampInt(int value, int min, int max)  '
        'THEN returns max', () {
      const value = 100;
      expect(
        clampInt(value, min, max),
        max,
        reason: 'should return `max`',
      );
    });
    test(
        'GIVEN  value < mix '
        'WHEN clampInt(int value, int min, int max)  '
        'THEN returns min', () {
      const value = 1;
      expect(
        clampInt(value, min, max),
        min,
        reason: 'should return `min`',
      );
    });

    test(
        'GIVEN  min < value < max '
        'WHEN clampInt(int value, int min, int max)  '
        'THEN returns value', () {
      const value = 10;
      expect(
        clampInt(value, min, max),
        value,
        reason: 'should return `value`',
      );
    });
  });
}
