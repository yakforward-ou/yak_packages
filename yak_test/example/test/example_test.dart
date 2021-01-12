import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';

/// STEP 1 - use  `yak_runner` from [https://pub.dev/packages/yak_runner]

final _runner = YakRunner<int>(() => 2);

/// STEP 2 - create a test with  `yak_test` from [https://pub.dev/packages/yak_test]

final _tester = _runner.buildTest(_runner.buildTestFactory('description here'));

/// STEP 3 - run the test

void main() => _tester(0);
