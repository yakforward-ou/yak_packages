import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_flutter/yak_flutter.dart';

void main() {
  group('PreferredSizeWidgetWithThemeX', () {
    group('ThemeOfContextX', () {
      test(
          'GIVEN a PreferredSizeWidget '
          'WHEN *.withTheme(ThemeData)'
          'THEN returns a PreferredSizeWidget', () {
        final widget = AppBar();
        final data = ThemeData();
        expect(
          widget.withTheme(data),
          isA<PreferredSizeWidget>(),
          reason: 'should output a PreferredSizeWidget',
        );
      });
    });
  });
}
