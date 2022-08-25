import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_flutter/yak_flutter.dart';

import '../tools/mock_context.dart';

void main() async {
  group('ThemeOfContextX', () {
    contextTest(
        'GIVEN a BuildContext ' 'WHEN context.theme ' 'THEN return ThemeData',
        (context) {
      expect(
        context.theme,
        isA<ThemeData>(),
        reason: 'should return ThemeData',
      );
    });
  });
  group('TextThemeOfContextX', () {
    contextTest(
        'GIVEN a BuildContext ' ' WHEN context.textTheme' 'THEN is a TextTheme',
        (context) {
      expect(
        context.textTheme,
        isA<TextTheme>(),
        reason: 'should return TextTheme',
      );
    });
  });

  group('MediaQueryOfContextX', () {
    contextTest(
        'GIVEN a BuildContext '
        ' WHEN context.mediaQuery '
        'THEN is a MediaQueryData', (context) {
      expect(
        context.mediaQuery,
        isA<MediaQueryData>(),
        reason: 'should return MediaQueryData',
      );
    });
  });

  group('SizeOfContextX', () {
    contextTest('GIVEN a BuildContext ' ' WHEN context.size ' 'THEN is a Size',
        (context) {
      expect(
        context.size,
        isA<Size>(),
        reason: 'should return Size',
      );
    });
  });

  group('PaddingOfContextX', () {
    contextTest(
        'GIVEN a BuildContext ' ' WHEN context.padding' 'THEN is a EdgeInsets',
        (context) {
      expect(
        context.padding,
        isA<EdgeInsets>(),
        reason: 'should return TextTheme',
      );
    });
  });
}
