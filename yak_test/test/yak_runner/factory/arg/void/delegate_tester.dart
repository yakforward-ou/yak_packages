import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

typedef void TestFunction(FutureOr<int> arg);

void main() {
  group('`TryRunArgTestFactory` test', () {
    test(
        'WHEN `TryAnyRunArg<int>` buildTest with `TryRunArgTestFactory` THEN returns `ArgTestDelegate<int>`',
        () async {
      final runner = TryRunArg<int>((i) {});
      final tester = runner.buildTest(TryRunArgTestFactory(''));

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
