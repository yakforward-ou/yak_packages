import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

typedef void TestFunction(FutureOr<String> result, FutureOr<int> arg);

void main() {
  group('`TryAnyRunTryArgTestFactory` test', () {
    test(
        'WHEN `TryAnyRunArg<String, int>` buildTest with `TryAnyRunArgTestFactory` THEN returns `ArgResultTestDelegate<String, int>`',
        () async {
      final runner = TryAnyRunTryArg<String, int>((_) => throw '', null);
      final tester = runner.buildTest(TryAnyRunTryArgTestFactory(''));

      expect(
        tester is ArgResultTestDelegate<String, int>,
        true,
        reason: 'tester should be ArgResultTestDelegate<String, int>',
      );

      expect(
        tester.call is TestFunction,
        true,
        reason:
            "`ArgResultTestFactoryDelegate.call` parameters' types should match `FutureArgDelegate` types",
      );
    });
  });
}
