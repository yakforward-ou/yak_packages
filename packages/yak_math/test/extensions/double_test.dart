import 'package:yak_math/yak_math.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('`RoundToPrecisionX` test', () {
    const precision = 2;
    test(
        'GIVEN a double `d` with precision > `precision  '
        '`WHEN d.roundToPrecision(precision) '
        'THEN new precision == `precision`', () {
      const d = 0.111111111111111111111111111111111111111111111111111111111;
      expect(
        ('$d'.length - 2) > precision,
        true,
        reason: 'verify d precision > `precision`',
      );
      final d2 = d.roundToPrecision(precision);
      expect(
        ('$d2'.length - 2) == precision,
        true,
        reason: 'verify d precision == `precision`',
      );
    });
    test(
        'GIVEN a double `d` with precision < `precision  '
        '`WHEN d.roundToPrecision(precision) '
        'THEN precision is unchanged', () {
      const d = 0.1;
      expect(
        ('$d'.length - 2) < precision,
        true,
        reason: 'verify d precision < `precision`',
      );
      final d2 = d.roundToPrecision(precision);
      expect(
        '$d2'.length,
        '$d'.length,
        reason: 'verify precision is unchanged',
      );
      expect(
        d,
        d2,
        reason: 'd should be equal to d2',
      );
    });
    test(
        'GIVEN a double `d` with precision == `precision  '
        '`WHEN d.roundToPrecision(precision) '
        'THEN d is unchanged', () {
      const d = 0.11;
      expect(
        ('$d'.length - 2) == precision,
        true,
        reason: 'verify d precision == `precision`',
      );
      final d2 = d.roundToPrecision(precision);
      expect(
        d,
        d2,
        reason: 'd should be equal to d2',
      );
    });
  });
}
