import 'package:flutter_test/flutter_test.dart';
import 'package:yak_extensions/yak_extensions.dart';

void main() {
  group('[YakNumExtensions]', () {
    test(
        '[smallest] should return the smaller num between [this] and the [argument]',
        () async {
      final int _nine = 9;
      expect(_nine.smallest(0), 0);
    });

    test(
        '[biggest] should return the bigger num between [this] and the [argument]',
        () async {
      final int _nine = 9;
      expect(_nine.biggest(0), 9);
    });

    test(
        '[cap] should limits the num to the lower or higher bounds provided as argumet',
        () async {
      expect((-1).cap(0, 9), 0);
      expect(5.cap(0, 9), 5);
      expect(99.cap(0, 9), 9);
    });

    test('''[capFromAbs] should l limits the num to the lower or higher bounds 
        of the positve of negative values of a provided natural number''',
        () async {
      expect((-1).capFromAbs(9), -1);
      expect(99.capFromAbs(9), 9);
      expect(-99.capFromAbs(9), -9);
    });

    test('''[reverseLerp] should provide the value [t] that passed into [lerp]
          together with [a] and [b] return the value [this]''', () async {
      final double _t = .5;
      final Offset _offset = Offset.lerp(Offset.zero, Offset(1, 1), _t);
      expect(_offset.dx.reverseLerp(0, 1), _t);
    });
  });
}
