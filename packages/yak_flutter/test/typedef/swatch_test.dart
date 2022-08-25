import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_flutter/yak_flutter.dart';

void main() {
  group('Swatch', () {
    test('GIVEN  a Swatch ' ' WHEN ... ' 'THEN is a Map<int, Color>', () {
      const Swatch swatch = {0: Colors.transparent};
      expect(
        swatch,
        isA<Map<int, Color>>(),
        reason: 'Swatch should be a Map<int, Color>',
      );
    });
  });
}
