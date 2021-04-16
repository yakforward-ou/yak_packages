import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'test_app.dart';

Rect _left(Rect rect) => Rect.fromLTWH(
      rect.left,
      rect.top,
      rect.width * .5,
      rect.height,
    );

Rect _right(Rect rect) => Rect.fromLTWH(
      rect.left + rect.width * .5,
      rect.top,
      rect.width * .5,
      rect.height,
    );

void main() {
  group('`Handedness` test', () {
    testWidgets(
        'WHEN no interaction with `trigger` THEN `subject` is ON THE RIGHT',
        (tester) async {
      await tester.pumpWidget(app);

      final parent = tester.getRect(find.byKey(Keys.parent));
      final subject = tester.getRect(find.byKey(Keys.subject));
      expect(subject.overlaps(_right(parent)), true,
          reason: 'should be on RIGHT side');
    });

    testWidgets('WHEN `trigger` tapped THEN `subject` is ON THE LEFT`',
        (tester) async {
      await tester.pumpWidget(app);

      await tester.tap(find.byKey(Keys.trigger));
      await tester.pumpAndSettle(const Duration(milliseconds: 300));

      final parent = tester.getRect(find.byKey(Keys.parent));
      final subject = tester.getRect(find.byKey(Keys.subject));

      expect(subject.overlaps(_left(parent)), true,
          reason: 'should be on LEFT side');
    });
    testWidgets('WHEN new test is run THEN `app state` is not persisted',
        (tester) async {
      await tester.pumpWidget(app);

      final parent = tester.getRect(find.byKey(Keys.parent));
      final subject = tester.getRect(find.byKey(Keys.subject));
      expect(subject.overlaps(_right(parent)), true,
          reason: 'should be on RIGHT side');
    });

    testWidgets(
        'WHEN `trigger` tapped **twice** THEN `subject`  is ON THE RIGHT',
        (tester) async {
      await tester.pumpWidget(app);

      await tester.tap(find.byKey(Keys.trigger));
      await tester.pumpAndSettle(const Duration(milliseconds: 300));

      await tester.tap(find.byKey(Keys.trigger));
      await tester.pumpAndSettle(const Duration(milliseconds: 300));

      final parent = tester.getRect(find.byKey(Keys.parent));
      final subject = tester.getRect(find.byKey(Keys.subject));
      expect(subject.overlaps(_right(parent)), true,
          reason: 'should be on RIGHT side');
    });
  });
}
