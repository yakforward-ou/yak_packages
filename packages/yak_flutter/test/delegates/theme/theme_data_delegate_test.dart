import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_flutter/yak_flutter.dart';

void main() {
  group('ThemeDataDelegate', () {
    test(
        'GIVEN ThemeDataDelegate '
        'WHEN ...'
        'THEN is a UnaryDelegate<ThemeData, ThemeData>', () {
      expect(
        const DefaultThemeDataDelegate(),
        isA<UnaryDelegate<ThemeData, ThemeData>>(),
        reason:
            'ThemeDataDelegate should be a UnaryDelegate<ThemeData, ThemeData>',
      );
    });
  });
}
