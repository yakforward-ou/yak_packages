import 'package:yak_runner/yak_runner.dart';
import '../../test/all.dart';

// implementation of `YakRunnerTestFactoryDelegate` from `yak_runner`

class YakRunnerArgAsyncTestFactory implements YakRunnerArgTestFactoryDelegate {
  const YakRunnerArgAsyncTestFactory(this.description);
  final String description;
  @override
  YakRunnerArgTestDelegate<T, S> call<T, S>() =>
      YakRunnerArgAsyncTest<T, S>(description: description);
}
