import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_flutter/yak_flutter.dart';

const whiteTheme = MonochromeThemeDelegate(
    background: Colors.white,
    foreground: Colors.white,
    shadow: Colors.white,
    error: Colors.white);
void main() {
  group('PreferredSizeWidgetWrapper', () {
    testWidgets(
        'GIVEN a PreferredSizeWidget child and ThemeData data '
        'WHEN used in PreferredSizeWidgetWrapper '
        'THEN ColorScheme is applied to child', (tester) async {
      final key = UniqueKey();
      final child = AppBar(key: key);
      final data = whiteTheme(ThemeData());
      final app = MaterialApp(
        home: Scaffold(
          appBar: PreferredSizeWidgetWrapper(
            data: data,
            child: child,
          ),
        ),
      );
      await tester.pumpWidget(app);
      final BuildContext context = tester.element(find.byKey(key));
      expect(
        context.theme.colorScheme == data.colorScheme,
        isTrue,
        reason: 'ColorScheme should match',
      );
    });
    testWidgets(
        'GIVEN a PreferredSizeWidget child and ThemeData data '
        'WHEN used in PreferredSizeWidgetWrapper '
        'THEN TextTheme is applied to child', (tester) async {
      final key = UniqueKey();
      final child = AppBar(key: key);
      final data = whiteTheme(ThemeData());
      final app = MaterialApp(
        home: Scaffold(
          appBar: PreferredSizeWidgetWrapper(
            data: data,
            child: child,
          ),
        ),
      );
      await tester.pumpWidget(app);
      final BuildContext context = tester.element(find.byKey(key));

      expect(
        context.theme.textTheme.displayLarge?.color ==
            data.textTheme.displayLarge?.color,
        isTrue,
        reason: 'displayLarge should match',
      );
      expect(
        context.theme.textTheme.displayMedium?.color ==
            data.textTheme.displayMedium?.color,
        isTrue,
        reason: 'displayMedium should match',
      );
      expect(
        context.theme.textTheme.displaySmall?.color ==
            data.textTheme.displaySmall?.color,
        isTrue,
        reason: 'displaySmall should match',
      );
      expect(
        context.theme.textTheme.headlineMedium?.color ==
            data.textTheme.headlineMedium?.color,
        isTrue,
        reason: 'headlineMedium should match',
      );
      expect(
        context.theme.textTheme.headlineSmall?.color ==
            data.textTheme.headlineSmall?.color,
        isTrue,
        reason: 'headlineSmall should match',
      );
      expect(
        context.theme.textTheme.titleLarge?.color ==
            data.textTheme.titleLarge?.color,
        isTrue,
        reason: 'titleLarge should match',
      );
      expect(
        context.theme.textTheme.titleMedium?.color ==
            data.textTheme.titleMedium?.color,
        isTrue,
        reason: 'titleMedium should match',
      );
      expect(
        context.theme.textTheme.titleSmall?.color ==
            data.textTheme.titleSmall?.color,
        isTrue,
        reason: 'titleSmall should match',
      );
      expect(
        context.theme.textTheme.bodyLarge?.color ==
            data.textTheme.bodyLarge?.color,
        isTrue,
        reason: 'bodyLarge should match',
      );
      expect(
        context.theme.textTheme.bodyMedium?.color ==
            data.textTheme.bodyMedium?.color,
        isTrue,
        reason: 'bodyMedium should match',
      );
      expect(
        context.theme.textTheme.bodySmall?.color ==
            data.textTheme.bodySmall?.color,
        isTrue,
        reason: 'bodySmall should match',
      );
      expect(
        context.theme.textTheme.labelLarge?.color ==
            data.textTheme.labelLarge?.color,
        isTrue,
        reason: 'labelLarge should match',
      );
      expect(
        context.theme.textTheme.labelSmall?.color ==
            data.textTheme.labelSmall?.color,
        isTrue,
        reason: 'labelSmall should match',
      );
    });
  });
}
