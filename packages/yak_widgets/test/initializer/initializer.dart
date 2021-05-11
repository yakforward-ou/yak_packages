import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_widgets/yak_widgets.dart';

void main() {
  final progress = ValueNotifier<Result<double>>(Success(.0));
  final loading = UniqueKey();
  final failed = UniqueKey();
  final completed = UniqueKey();

  final app = MaterialApp(
    home: Material(
      child: Initializer(
        loadingScreen: (context, progress) => Container(key: loading),
        progressState: progress,
        onCompleted: (context) => Container(key: completed),
        onFailed: (context) => Container(key: failed),
      ),
    ),
  );
  group('`Initializer` test', () {
    testWidgets(
        'WHEN progress is Success & < 1 THEN `loadingScreen` is VISIBLE',
        (tester) async {
      await tester.pumpWidget(app);

      expect(
        find.byKey(loading),
        findsOneWidget,
        reason: ' `loadingScreen` should be VISIBLE',
      );
      expect(
        find.byKey(completed),
        findsNothing,
        reason: ' `onCompleted` should NOT be VISIBLE',
      );
      expect(
        find.byKey(failed),
        findsNothing,
        reason: ' `onFailed` should NOT be VISIBLE',
      );
    });

    testWidgets(
        'WHEN progress is Success & >= 1 ' 'THEN `onCompleted` is VISIBLE',
        (tester) async {
      await tester.pumpWidget(app);
      progress.value = Success(1);
      await tester.pumpAndSettle(kThemeAnimationDuration);

      expect(
        find.byKey(loading),
        findsNothing,
        reason: ' `loadingScreen` should NOT be VISIBLE',
      );
      expect(
        find.byKey(completed),
        findsOneWidget,
        reason: ' `onCompleted` should be VISIBLE',
      );

      expect(
        find.byKey(failed),
        findsNothing,
        reason: ' `onFailed` should NOT be VISIBLE',
      );
    });

    testWidgets('WHEN progress is `Failure` ' 'THEN `onFailed` is VISIBLE',
        (tester) async {
      await tester.pumpWidget(app);
      progress.value = Failure<double>(ErrorReport());
      await tester.pumpAndSettle(kThemeAnimationDuration);

      expect(
        find.byKey(loading),
        findsNothing,
        reason: ' `loadingScreen` should NOT be VISIBLE',
      );
      expect(
        find.byKey(completed),
        findsNothing,
        reason: ' `onCompleted` should NOT be VISIBLE',
      );

      expect(
        find.byKey(failed),
        findsOneWidget,
        reason: ' `onFailed` should  be VISIBLE',
      );
    });
  });
}
