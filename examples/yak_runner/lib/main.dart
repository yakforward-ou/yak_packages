import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_runner/yak_runner.dart';

Stream<int> get stream => Stream.fromIterable([for (var i = 0; i < 10; ++i) i]);

final runner = UnaryRunner<void, int>(
  (i) {
    avow(i.isEven);
    print(i);
  },
  errorHandlers: {ErrorHandler<AvowError>((_) => print('this is odd!'))},
);

void main() => stream.listen(runner);
