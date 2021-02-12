# Example

```dart
import 'dart:async';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';

final unaryRunner = YakRunnerArg((int i) => '$i');
final unaryTest = unaryRunner.buildTest(
  unaryRunner.buildTestFactory('unary test'),
);

final nullaryRunner = YakRunner(() => 0);
final nullaryTest = nullaryRunner.buildTest(
  nullaryRunner.buildTestFactory('nullary test'),
);

final unaryAsyncRunner = YakRunnerArgAsync((FutureOr<int> i) async => '$i');
final unaryAsyncTest = unaryAsyncRunner.buildTest(
  unaryAsyncRunner.buildTestFactory('async unary test'),
);

final nullaryAsyncRunner = YakRunnerAsync(() async => 0);
final nullaryAsyncTest = nullaryAsyncRunner.buildTest(
  nullaryAsyncRunner.buildTestFactory('async nullary test'),
);

void main() {
  unaryTest('hello', 0);
  nullaryTest(0);
  unaryAsyncTest('hello', 0);
  nullaryAsyncTest(0);
}
```

[Jump to Source](https://github.com/iapicca/yak_packages/tree/master/yak_test/test/yak_runner_test)