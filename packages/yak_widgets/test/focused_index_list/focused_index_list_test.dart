import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stub/stub.dart';
import 'package:yak_widgets/yak_widgets.dart';

import 'test_app.dart';

void main() {
  final onIndexChanged = unaryStub<void, int>()..stub = (_) {};
  final onPressed = nullaryStub<void>()..stub = () {};
  group('`IndexSelector` test', () {
    testWidgets(
        'GIVEN widget not in focus '
        'WHEN when widget is tapped '
        'THEN onIndexChanged is called', (tester) async {
      {
        onIndexChanged.reset;
        onPressed.reset;

        await tester.pumpWidget(
          focusedIndexListApp(
            onIndexChanged: onIndexChanged.wrap,
            onPressed: onPressed.wrap,
          ),
        );

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

        await tester.pumpWidget(
          focusedIndexListApp(
            onIndexChanged: onIndexChanged.wrap,
            onPressed: onPressed.wrap,
          ),
        );

        await tester.tap(find.byKey(ValueKey(0)));
        await tester.pumpAndSettle(kThemeAnimationDuration * 2);

        expect(
          onPressed.count,
          1,
          reason: '`onPressed` should be called once',
        );
        expect(
          onIndexChanged.count,
          0,
          reason: '`onIndexChanged` should not be called',
        );
      }
    });

    testWidgets(
        'GIVEN widget is out of focus '
        'WHEN when widget is tapped '
        'THEN moves in focus', (tester) async {
      {
        onIndexChanged.reset;
        onPressed.reset;

        await tester.pumpWidget(
          focusedIndexListApp(
            onIndexChanged: onIndexChanged.wrap,
            onPressed: onPressed.wrap,
          ),
        );

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

        onIndexChanged.reset;
        onPressed.reset;

        await tester.tap(find.byKey(ValueKey(1)));
        await tester.pumpAndSettle(kThemeAnimationDuration * 2);

        expect(
          onPressed.count,
          1,
          reason: '`onPressed` should be called once',
        );
        expect(
          onIndexChanged.count,
          0,
          reason: '`onIndexChanged` should not be called',
        );
      }
    });

    testWidgets(
        'WHEN childrenAlignment is provied '
        'THEN children respect the alignment', (tester) async {
      {
        Rect left(Rect rect) => Rect.fromLTWH(
              rect.left,
              rect.top,
              rect.width * .5,
              rect.height,
            );

        onIndexChanged.reset;
        onPressed.reset;

        await tester.pumpWidget(
          focusedIndexListApp(
            alignment: Alignment.centerLeft,
            onIndexChanged: onIndexChanged.wrap,
            onPressed: onPressed.wrap,
          ),
        );

        final parent = tester.getRect(find.byKey(ValueKey('parent')));
        final subject = tester.getRect(find.byKey(ValueKey(0)));
        expect(subject.overlaps(left(parent)), true,
            reason: 'should be on RIGHT side');
      }
    });

    testWidgets(
        'WHEN `initialIndex` is provided '
        'THEN the item at that index is selected', (tester) async {
      {
        onIndexChanged.reset;
        onPressed.reset;

        final initialIndex = 3;

        await tester.pumpWidget(
          focusedIndexListApp(
            initial: initialIndex,
            onIndexChanged: onIndexChanged.wrap,
            onPressed: onPressed.wrap,
          ),
        );

        await tester.tap(find.byKey(ValueKey(initialIndex)));
        await tester.pumpAndSettle(kThemeAnimationDuration * 2);

        expect(
          onPressed.count,
          1,
          reason: '`onPressed` should be called once',
        );
        expect(
          onIndexChanged.count,
          0,
          reason: '`onIndexChanged` should not be called',
        );
      }
    });

    testWidgets(
        'WHEN `focusedIndex` is provided '
        'THEN the item at that index is selected', (tester) async {
      {
        onIndexChanged.reset;
        onPressed.reset;

        final focusedIndex = 3;
        final items = 5;

        await tester.pumpWidget(
          focusedIndexListApp(
            items: items,
            focus: focusedIndex,
            onIndexChanged: onIndexChanged.wrap,
            onPressed: onPressed.wrap,
          ),
        );

        int top(Key k) => tester.getRect(find.byKey(k)).top.round();

        final keys = [for (var i = 0; i < 5; ++i) ValueKey(i)];
        final firstKey = keys.first;
        keys.sort((k1, k2) => top(k1).compareTo(top(k2)));

        expect(
          keys.indexOf(firstKey),
          focusedIndex,
          reason: 'first key should be at `focusedIndex`',
        );
      }
    });

    testWidgets(
        'WHEN `focusedIndex >= itemCount ^ focusedIndex < 0 '
        'THEN `AssertionError` is thrown', (tester) async {
      {
        expect(
          () => FocusedIndexList(
            focusedIndex: -1,
            builder: (_, __, ___) => Container(),
            itemCount: 3,
          ),
          throwsA(isA<AssertionError>()),
          reason: 'should throw assertion error',
        );
        expect(
          () => FocusedIndexList(
            focusedIndex: 7,
            builder: (_, __, ___) => Container(),
            itemCount: 3,
          ),
          throwsA(isA<AssertionError>()),
          reason: 'should throw assertion error`',
        );
      }
    });
    testWidgets(
        'WHEN `initialIndex >= itemCount ^ focusedIndex < 0 '
        'THEN `AssertionError` is thrown', (tester) async {
      {
        expect(
          () => FocusedIndexList(
            initialIndex: -1,
            builder: (_, __, ___) => Container(),
            itemCount: 3,
          ),
          throwsA(isA<AssertionError>()),
          reason: 'should throw assertion error',
        );
        expect(
          () => FocusedIndexList(
            initialIndex: 7,
            builder: (_, __, ___) => Container(),
            itemCount: 3,
          ),
          throwsA(isA<AssertionError>()),
          reason: 'should throw assertion error',
        );
      }
    });
  });
}
