import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

typedef void TestFunction(FutureOr<int> result);

void main() {
  group('`TryAnyRunAsyncTestFactory` test', () {
    test(
        'WHEN `TryAnyRunAsync<int>` buildTest with `TryRunArgTestFactory` THEN returns `ResultTestDelegate<int>`',
        () async {
      final runner = TryAnyRunAsync<int>(() => 1);
      final tester = runner.buildTest(TryAnyRunAsyncTestFactory(''));

      expect(
        tester is ResultTestDelegate<int>,
        true,
        reason: 'tester should be ResultTestDelegate<int>',
      );

      expect(
        tester.call is TestFunction,
        true,
        reason:
            "`ResultTestFactoryDelegate.call` parameters' types should match `ArgDelegate` types ",
      );
    });
  });
}
