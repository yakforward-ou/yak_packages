import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/extensions/all.dart';

typedef void TestFunction(FutureOr<int> arg);

void main() {
  group('`TryRunArgAsyncTestFactoryExtension` test', () {
    test(
        'WHEN `TryAnyRunArgAsync<int>` buildTester THEN returns `ArgTestDelegate<int>`',
        () async {
      final runner = TryRunArgAsync<int>((i) {});
      final tester = runner.buildTester('');

      expect(
        tester is ArgTestDelegate<int>,
        true,
        reason: 'tester should be ArgTestDelegate<int>',
      );
    });
  });
}
