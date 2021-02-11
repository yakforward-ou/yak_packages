import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'test_app.dart';

void main() {
  group('`YakSidebar` test', () {
    testWidgets('WHEN no interaction with `trigger` THEN find index 0',
        (tester) async {
      {
        await tester.pumpWidget(app);
      }
      expect(find.byKey(ValueKey(0)), findsOneWidget,
          reason: 'ScrollView should be at index 0');
      expect(find.byKey(ValueKey(1)), findsNothing,
          reason: 'ScrollView should not show any other index');
    });

    testWidgets(
        'WHEN `trigger` is scrolled ***enough*** '
        'THEN scrolls listening widget', (tester) async {
      {
        await tester.pumpWidget(app);
      }
      {
        final size = tester.getRect(find.byKey(Keys.parent)).size;
        await tester.drag(
          find.byKey(Keys.trigger),
          Offset(0.0, -size.height * .1),
        );
        await tester.pumpAndSettle(const Duration(milliseconds: 300));
      }
      expect(find.byKey(ValueKey(1)), findsOneWidget,
          reason: 'ScrollView should be at index 1');
      expect(find.byKey(ValueKey(0)), findsNothing,
          reason: 'ScrollView should not show any other index');
    });

    testWidgets(
        'WHEN `trigger` is NOT scrolled ***enough*** '
        'THEN nothing happens', (tester) async {
      {
        await tester.pumpWidget(app);
      }
      {
        final size = tester.getRect(find.byKey(Keys.parent)).size;
        await tester.drag(
          find.byKey(Keys.trigger),
          Offset(0.0, -size.height * .0001),
        );
        await tester.pumpAndSettle(const Duration(milliseconds: 300));
      }
      expect(find.byKey(ValueKey(0)), findsOneWidget,
          reason: 'ScrollView should be at index 0');
      expect(find.byKey(ValueKey(1)), findsNothing,
          reason: 'ScrollView should not show any other index');
    });

    testWidgets('WHEN new test is run THEN `app state` is not persisted',
        (tester) async {
      {
        await tester.pumpWidget(app);
      }
      expect(find.byKey(ValueKey(0)), findsOneWidget,
          reason: 'ScrollView should be at index 0');
      expect(find.byKey(ValueKey(1)), findsNothing,
          reason: 'ScrollView should not show any other index');
    });

    testWidgets(
        'WHEN `trigger` scrolled once forward and back'
        ' THEN find index is unchanged', (tester) async {
      {
        await tester.pumpWidget(app);
      }
      {
        final size = tester.getRect(find.byKey(Keys.parent)).size;
        await tester.drag(
          find.byKey(Keys.trigger),
          Offset(0.0, -size.height * .1),
        );
        await tester.pumpAndSettle(const Duration(milliseconds: 300));
      }
      {
        final size = tester.getRect(find.byKey(Keys.parent)).size;
        await tester.drag(
          find.byKey(Keys.trigger),
          Offset(0.0, size.height * .1),
        );
        await tester.pumpAndSettle(const Duration(milliseconds: 300));
      }
      expect(find.byKey(ValueKey(0)), findsOneWidget,
          reason: 'ScrollView should be at index 0');
      expect(find.byKey(ValueKey(1)), findsNothing,
          reason: 'ScrollView should not show any other index');
    });
  });
}
