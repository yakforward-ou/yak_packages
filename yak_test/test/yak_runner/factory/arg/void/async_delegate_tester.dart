import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

typedef void TestFunction(FutureOr<int> arg);

void main() {
  group('`TryRunArgAsyncTestFactory` test', () {
    test(
        'WHEN `TryAnyRunArgAsync<int>` buildTest with `TryRunArgAsyncTestFactory` THEN returns `ArgTestDelegate<int>`',
        () async {
      final runner = TryRunArgAsync<int>((i) {});
      final tester = runner.buildTest(TryRunArgAsyncTestFactory(''));

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
