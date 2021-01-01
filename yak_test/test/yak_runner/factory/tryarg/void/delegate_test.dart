import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

typedef void TestFunction(FutureOr<int> arg);

void main() {
  group('`TryRunTryArgTestFactory` test', () {
    test(
        'WHEN `TryRunTryArg<int>` buildTest with `TryRunTryArgTestFactory` THEN returns `ArgTestDelegate<int>`',
        () async {
      final runner = TryRunTryArg<int>((_) {}, null);
      final tester = runner.buildTest(TryRunTryArgTestFactory(''));

      expect(
        tester is ArgTestDelegate<int>,
        true,
        reason: 'tester should be ArgTestDelegate<int>',
      );

      expect(
        tester.call is TestFunction,
        true,
        reason:
            "`ArgTestFactoryDelegate.call` parameters' types should match `ArgDelegate` types ",
      );
    });
  });
}
