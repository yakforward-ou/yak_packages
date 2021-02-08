import 'package:yak_runner/yak_runner.dart';
import '../../test/all.dart';

// implementation of `YakRunnerTestFactoryDelegate` from `yak_runner`

class YakRunnerAsyncTestFactory implements YakRunnerTestFactoryDelegate {
  const YakRunnerAsyncTestFactory(this.description);
  final String description;
  @override
  YakRunnerTestDelegate<T> call<T>() =>
      YakRunnerAsyncTest<T>(description: description);
}
