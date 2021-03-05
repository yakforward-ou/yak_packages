# Example

```dart
import 'dart:math' as math;
import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_runner/yak_runner.dart';

final _random = math.Random();

void veryBadAPI(int i) =>
    _random.nextBool() ? print('$i') : throw Exception('ops');

void main() {
  final runner = YakRunnerArg(veryBadAPI, handleException: ExceptionHandler());

  ExceptionHandler().handleException =
      (e, s) => print('****** ERRROR COUGHT *******\n$e\n$s');

  for (var i = 0; i < 10; ++i) {
    runner(i);
  }

  ExceptionHandler().handleException =
      (e, s) => print('*** UPDATED ERROR MESSAGE***');

  for (var i = 0; i < 10; ++i) {
    runner(i);
  }
}

```

[Jump to Source](https://github.com/iapicca/yak_packages/tree/master/examples/yak_error_handler)
