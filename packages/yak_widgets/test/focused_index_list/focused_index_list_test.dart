import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stub/stub.dart';
import 'test_app.dart';

void main() {
  final onIndexChanged = unaryStub<void, int>();
  group('`IndexSelector` test', () {
    testWidgets(
        'GIVEN `keys =  Valuekey 0 - 4` and `alwaysTriggerOnTap = false`'
        'WHEN when tap on key > 0 '
        'THEN onIndexChanged is called', (tester) async {
      {
        await tester.pumpWidget(app(onIndexChanged.wrap));
        {
          await tester.tap(find.byKey(ValueKey(1)));
          await tester.pumpAndSettle(kThemeAnimationDuration * 2);
        }
        expect(
          onIndexChanged.count,
          1,
          reason: '`onIndexChanged` should be called once',
        );
      }
    });
  });
}
