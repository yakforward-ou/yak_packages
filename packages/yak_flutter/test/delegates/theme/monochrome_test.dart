import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_flutter/yak_flutter.dart';

void main() {
  final themeData = ThemeData();
  const tester = MonochromeThemeDelegate(
    background: Colors.red,
    foreground: Colors.blue,
    error: Colors.green,
    shadow: Colors.yellow,
  );

  group('MonochromeThemeDelegate', () {
    test(
        'GIVEN a MonochromeThemeDelegate '
        'WHEN ... '
        'THEN is a ThemeDataDelegate', () {
      expect(
        tester,
        isA<ThemeDataDelegate>(),
        reason: 'MonochromeThemeDelegate should be a ThemeDataDelegate',
      );
    });

    test(
        'GIVEN a MonochromeThemeDelegate '
        'WHEN call(ThemeData) '
        'THEN return ThemeData', () {
      expect(
        tester(themeData),
        isA<ThemeData>(),
        reason: 'call should be output ThemeData',
      );
    });

    test(
        'GIVEN a MonochromeThemeDelegate '
        'WHEN toJson() '
        'THEN return predictable data', () {
      final Json json = {
        'background': tester.background.value,
        'foreground': tester.foreground.value,
        'foregroundOnBackgroundRatio': tester.foregroundOnBackgroundRatio,
        'luminanceThreshold': tester.luminanceThreshold,
        'luminance': tester.luminance,
        'neutral': tester.shadow.value,
        'error': tester.error.value,
      };

      expect(
        json.equals(tester.toJson()),
        isTrue,
        reason: 'toJson should be predictable',
      );
    });

    test(
        'GIVEN a MonochromeThemeDelegate '
        'WHEN toString() '
        'THEN return predictable data', () {
      expect(
        '$tester' == tester.toJson().toString(),
        isTrue,
        reason: 'toString should be predictable',
      );
    });

    test(
        'GIVEN 2 different MonochromeThemeDelegate '
        'WHEN ==  '
        'THEN return false', () {
      const other = MonochromeThemeDelegate(
        background: Colors.transparent,
        foreground: Colors.transparent,
        error: Colors.transparent,
        shadow: Colors.transparent,
      );
      expect(
        tester == other,
        isFalse,
        reason: 'should be false',
      );
    });
    test(
        'GIVEN 2 identical MonochromeThemeDelegate '
        'WHEN ==  '
        'THEN return trues', () {
      const other = tester;
      expect(
        tester == other,
        isTrue,
        reason: 'should be true',
      );
    });

    test(
        'GIVEN a MonochromeThemeDelegate '
        'WHEN call(ThemeData) '
        'THEN return a textTheme with predictable values', () {
      final output = tester(themeData);
      final textTheme = output.textTheme;
      expect(
        textTheme.displayLarge?.color?.value == tester.foreground.value,
        isTrue,
        reason: 'color should be predictable',
      );
      expect(
        textTheme.displayMedium?.color?.value == tester.foreground.value,
        isTrue,
        reason: 'color should be predictable',
      );
      expect(
        textTheme.displaySmall?.color?.value == tester.foreground.value,
        isTrue,
        reason: 'color should be predictable',
      );
      expect(
        textTheme.headlineMedium?.color?.value == tester.foreground.value,
        isTrue,
        reason: 'color should be predictable',
      );
      expect(
        textTheme.headlineSmall?.color?.value == tester.foreground.value,
        isTrue,
        reason: 'color should be predictable',
      );
      expect(
        textTheme.titleLarge?.color?.value == tester.foreground.value,
        isTrue,
        reason: 'color should be predictable',
      );
      expect(
        textTheme.titleMedium?.color?.value == tester.foreground.value,
        isTrue,
        reason: 'color should be predictable',
      );
      expect(
        textTheme.bodyLarge?.color?.value == tester.foreground.value,
        isTrue,
        reason: 'color should be predictable',
      );
      expect(
        textTheme.bodyMedium?.color?.value == tester.foreground.value,
        isTrue,
        reason: 'color should be predictable',
      );
      expect(
        textTheme.bodySmall?.color?.value == tester.foreground.value,
        isTrue,
        reason: 'color should be predictable',
      );
      expect(
        textTheme.labelLarge?.color?.value == tester.foreground.value,
        isTrue,
        reason: 'color should be predictable',
      );
      expect(
        textTheme.labelSmall?.color?.value == tester.foreground.value,
        isTrue,
        reason: 'color should be predictable',
      );
    });
    test(
        'GIVEN a MonochromeThemeDelegate '
        'WHEN call(ThemeData) '
        'THEN return a ColorScheme with predictable values', () {
      final output = tester(themeData);
      final colorScheme = output.colorScheme;
      expect(
        colorScheme.background.value == tester.background.value,
        isTrue,
        reason: 'color should be predictable',
      );
      expect(
        colorScheme.brightness ==
            (tester.luminance < tester.luminanceThreshold
                ? Brightness.dark
                : Brightness.light),
        isTrue,
        reason: 'brightness should be predictable',
      );
      expect(
        colorScheme.error.value == tester.error.value,
        isTrue,
        reason: 'color should be predictable',
      );
      expect(
        colorScheme.onBackground.value == tester.foreground.value,
        isTrue,
        reason: 'color should be predictable',
      );
      expect(
        colorScheme.onError.value ==
            (tester.onError?.value ?? tester.foreground.value),
        isTrue,
        reason: 'color should be predictable',
      );
      expect(
        colorScheme.onPrimary.value == tester.foreground.value,
        isTrue,
        reason: 'color should be predictable',
      );
      expect(
        colorScheme.onSecondary.value == tester.foreground.value,
        isTrue,
        reason: 'color should be predictable',
      );
      expect(
        colorScheme.primary.value == tester.background.value,
        isTrue,
        reason: 'color should be predictable',
      );
      expect(
        colorScheme.secondary.value == tester.background.value,
        isTrue,
        reason: 'color should be predictable',
      );
      expect(
        colorScheme.surface.value == tester.background.value,
        isTrue,
        reason: 'color should be predictable',
      );
    });
  });
}
