import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/extensions/all.dart';

typedef void TestFunction(FutureOr<String> result, FutureOr<int> arg);

void main() {
  group('`TryAnyRunArgAsyncTestFactoryExtension` test', () {
    test(
        'WHEN `TryAnyRunArgAsync<String, int>` buildTester THEN returns `ArgResultTestDelegate<String, int>`',
        () async {
      final runner = TryAnyRunArgAsync<String, int>((i) => '$i');
      final tester = runner.buildTester('');

      expect(
        tester is ArgResultTestDelegate<String, int>,
        true,
        reason: 'tester should be ArgResultTestDelegate<String, int>',
      );
    });
  });
}
