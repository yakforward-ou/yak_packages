# Example

```dart
import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_runner/yak_runner.dart';

Stream<int> get stream => Stream.fromIterable([for (var i = 0; i < 10; ++i) i]);

final onError = ErrorHandler<AvowError>((_) => print('this is odd!'));
final runner = YakRunnerArg<void, int>(
  (i) {
    avow(i.isEven);
    print(i);
  },
  exceptionHandler: ExceptionHandler(),
  errorHandlers: {onError},
);

void main() => stream.listen(runner);
```

[Jump to Source](https://github.com/iapicca/yak_packages/tree/master/examples/yak_runner)
