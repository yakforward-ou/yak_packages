import 'package:flutter_test/flutter_test.dart';
import 'test_app.dart';

void main() {
  group('`Damper` test', () {
    testWidgets(
        'WHEN no interaction with `trigger` THEN `subject` is ON SCREEN',
        (tester) async {
      {
        await tester.pumpWidget(app);
      }
      final parent = tester.getRect(find.byKey(Keys.parent));
      final subject = tester.getRect(find.byKey(Keys.subject));
      expect(parent.overlaps(subject), true, reason: 'should be ON-screen');
    });

    testWidgets('WHEN `trigger` tapped THEN `subject` is OFF SCREEN`',
        (tester) async {
      {
        await tester.pumpWidget(app);
      }
      {
        await tester.tap(find.byKey(Keys.trigger));
        await tester.pumpAndSettle(const Duration(milliseconds: 300));
      }
      final parent = tester.getRect(find.byKey(Keys.parent));
      final subject = tester.getRect(find.byKey(Keys.subject));
      expect(parent.overlaps(subject), false, reason: 'should be OFF-screen');
    });
    testWidgets('WHEN new test is run THEN `app state` is not persisted',
        (tester) async {
      {
        await tester.pumpWidget(app);
      }
      final parent = tester.getRect(find.byKey(Keys.parent));
      final subject = tester.getRect(find.byKey(Keys.subject));

      expect(parent.overlaps(subject), true, reason: 'should be ON-screen');
    });

    testWidgets('WHEN `trigger` tapped **twice** THEN `subject` is ON SCREEN`',
        (tester) async {
      {
        await tester.pumpWidget(app);
      }
      {
        await tester.tap(find.byKey(Keys.trigger));
        await tester.pumpAndSettle(const Duration(milliseconds: 300));
      }
      {
        await tester.tap(find.byKey(Keys.trigger));
        await tester.pumpAndSettle(const Duration(milliseconds: 300));
      }
      final parent = tester.getRect(find.byKey(Keys.parent));
      final subject = tester.getRect(find.byKey(Keys.subject));

      expect(parent.overlaps(subject), true, reason: 'should be ON-screen');
    });
  });
}
