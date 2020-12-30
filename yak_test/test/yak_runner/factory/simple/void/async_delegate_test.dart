import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

typedef void TestFunction();

void main() {
  group('`TryRunAsyncTestFactory` test', () {
    test(
        'WHEN `TryAnyRunAsync<int>` buildTest with `VoidTestFactoryDelegate` THEN returns `VoidTestDelegate`',
        () async {
      final runner = TryRunAsync(() {});
      final tester = runner.buildTest(TryRunAsyncTestFactory(''));

      expect(
        tester is VoidTestDelegate,
        true,
        reason: 'tester should be VoidTestDelegate',
      );

      expect(
        tester.call is TestFunction && runner.fun is TestFunction,
        true,
        reason: "`VoidTestDelegate.call` should match 'runner.fun'",
      );
    });
  });
}
