import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

typedef ContextTest = FutureOr<void> Function(BuildContext);

void contextTest(
  String description,
  ContextTest test,
) async {
  final key = UniqueKey();
  final widget = MaterialApp(home: SizedBox(key: key));
  testWidgets(description, (tester) async {
    await tester.pumpWidget(widget);
    final BuildContext context = tester.element(find.byKey(key));
    await test(context);
  });
}
