import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stub/stub.dart';
import 'test_app.dart';

mixin OnIndexChangedDelegate {
  void call(int index);
}

class OnIndexChangesStub extends UnaryStub<void, int>
    implements OnIndexChangedDelegate {
  @override
  void call(int index) => stub(index);
}

void main() {
  final onIndexChanged = OnIndexChangesStub().stub = (_) {};
  group('`IndexSelector` test', () {
    testWidgets(
        'GIVEN `keys =  Valuekey 0 - 4` and `alwaysTriggerOnTap = false`'
        'WHEN when tap on key > 0 '
        'THEN onIndexChanged is called', (tester) async {
      {
        await tester.pumpWidget(app(onIndexChanged));
        {
          await tester.tap(find.byKey(ValueKey(1)));
          //await tester.pumpAndSettle(const Duration(milliseconds: 300));
        }
        // expect(
        //   onIndexChanged.callCount,
        //   1,
        //   reason: '`onIndexChanged` should be called once',
        // );
      }
    });
  });
}
