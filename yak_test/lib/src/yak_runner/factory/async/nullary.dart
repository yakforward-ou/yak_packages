import 'package:yak_runner/yak_runner.dart';
import '../../test/all.dart';

class YakRunnerAsyncTestFactory implements YakRunnerTestFactoryDelegate {
  const YakRunnerAsyncTestFactory(this.description);
  final String description;
  @override
  YakRunnerTestDelegate<T> call<T>() =>
      YakRunnerAsyncTest<T>(description: description);
}
