import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_runner/yak_runner.dart';

import 'test_app.dart';

void main() {
  group('`Initializer` test', () {
    final progress = ValueNotifier<Result<double>>(Success(.0));
    testWidgets(
        'WHEN progress is Success & < 1 THEN `loadingScreen` is VISIBLE',
        (tester) async {
      await tester.pumpWidget(app(progress));

      expect(
        find.byKey(Keys.loading),
        findsOneWidget,
        reason: ' `loadingScreen` should be VISIBLE',
      );
      expect(
        find.byKey(Keys.completed),
        findsNothing,
        reason: ' `onCompleted` should NOT be VISIBLE',
      );
      expect(
        find.byKey(Keys.failed),
        findsNothing,
        reason: ' `onFailed` should NOT be VISIBLE',
      );
    });

    testWidgets(
        'WHEN progress is Success & >= 1 ' 'THEN `onCompleted` is VISIBLE',
        (tester) async {
      await tester.pumpWidget(app(progress));
      progress.value = Success(1);
      await tester.pumpAndSettle(kThemeAnimationDuration);

      expect(
        find.byKey(Keys.loading),
        findsNothing,
        reason: ' `loadingScreen` should NOT be VISIBLE',
      );
      expect(
        find.byKey(Keys.completed),
        findsOneWidget,
        reason: ' `onCompleted` should be VISIBLE',
      );

      expect(
        find.byKey(Keys.failed),
        findsNothing,
        reason: ' `onFailed` should NOT be VISIBLE',
      );
    });

    testWidgets('WHEN progress is `Failure` ' 'THEN `onFailed` is VISIBLE',
        (tester) async {
      await tester.pumpWidget(app(progress));
      progress.value = Failure<double>(ErrorReport());
      await tester.pumpAndSettle(kThemeAnimationDuration);

      expect(
        find.byKey(Keys.loading),
        findsNothing,
        reason: ' `loadingScreen` should NOT be VISIBLE',
      );
      expect(
        find.byKey(Keys.completed),
        findsNothing,
        reason: ' `onCompleted` should NOT be VISIBLE',
      );

      expect(
        find.byKey(Keys.failed),
        findsOneWidget,
        reason: ' `onFailed` should  be VISIBLE',
      );
    });
  });
}
