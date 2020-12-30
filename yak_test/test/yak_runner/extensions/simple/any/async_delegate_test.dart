import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/extensions/all.dart';

typedef void TestFunction(FutureOr<int> result);

void main() {
  group('`TryAnyRunAsyncTestFactoryExtension` test', () {
    test(
        'WHEN `TryAnyRunAsync<int>` buildTester THEN returns `ResultTestDelegate<int>`',
        () async {
      final runner = TryAnyRunAsync<int>(() => 1);
      final tester = runner.buildTester('');

      expect(
        tester is ResultTestDelegate<int>,
        true,
        reason: 'tester should be ResultTestDelegate<int>',
      );
    });
  });
}
