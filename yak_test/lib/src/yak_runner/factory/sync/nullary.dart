import 'package:yak_runner/yak_runner.dart';
import '../../test/all.dart';

// implementation of `YakRunnerTestFactoryDelegate` from `yak_runner`

class YakRunnerTestFactory implements YakRunnerTestFactoryDelegate {
  const YakRunnerTestFactory(this.description);
  final String description;
  @override
  YakRunnerTestDelegate<T> call<T>() =>
      YakRunnerTest<T>(description: description);
}
