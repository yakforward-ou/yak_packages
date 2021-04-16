import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stub/stub.dart';

import 'test_app.dart';

void main() {
  final onIndexChanged = unaryStub<void, int>()..stub = (_) {};
  final onPressed = nullaryStub<void>()..stub = () {};
  final app = focusedIndexListApp(
    onIndexChanged: onIndexChanged.wrap,
    onPressed: onPressed.wrap,
  );
  group('`IndexSelector` test', () {
    testWidgets(
        'GIVEN widget not in focus '
        'WHEN when widget is tapped '
        'THEN onIndexChanged is called', (tester) async {
      {
        onIndexChanged.reset;
        onPressed.reset;

        await tester.pumpWidget(app);

        await tester.tap(find.byKey(ValueKey(1)));
        await tester.pumpAndSettle(kThemeAnimationDuration * 2);

        expect(
          onIndexChanged.count,
          1,
          reason: '`onIndexChanged` should be called once',
        );
        expect(
          onPressed.count,
          0,
          reason: '`onPressed` should not be called',
        );
      }
    });
    testWidgets(
        'GIVEN widget is in focus '
        'WHEN when widget is tapped '
        'THEN onPressed is called', (tester) async {
      {
        onIndexChanged.reset;
        onPressed.reset;

        await tester.pumpWidget(app);

        await tester.tap(find.byKey(ValueKey(0)));
        await tester.pumpAndSettle(kThemeAnimationDuration * 2);

        expect(
          onPressed.count,
          1,
          reason: '`onIndexChanged` should be called once',
        );
        expect(
          onIndexChanged.count,
          0,
          reason: '`onPressed` should not be called',
        );
      }
    });
  });
}
