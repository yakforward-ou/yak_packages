import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

typedef void TestFunction(FutureOr<int> arg);

void main() {
  group('`TryRunTryArgAsyncTestFactory` test', () {
    test(
        'WHEN `TryRunTryArgAsync<int>` buildTest with `TryRunTryArgAsyncTestFactory` THEN returns `ArgTestDelegate<int>`',
        () async {
      final runner = TryRunTryArgAsync<int>((_) {}, null);
      final tester = runner.buildTest(TryRunTryArgAsyncTestFactory(''));

      expect(
        tester is ArgTestDelegate<int>,
        true,
        reason: 'tester should be ArgTestDelegate<int>',
      );

      expect(
        tester.call is TestFunction,
        true,
        reason:
            "`ArgTestFactoryDelegate.call` parameters' types should match `FutureArgDelegate` types ",
      );
    });
  });
}
