import 'package:yak_runner/yak_runner.dart';
import '../../test/all.dart';

class YakRunnerArgAsyncTestFactory implements YakRunnerArgTestFactoryDelegate {
  const YakRunnerArgAsyncTestFactory(this.description);
  final String description;
  @override
  YakRunnerArgTestDelegate<T, S> call<T, S>() =>
      YakRunnerArgAsyncTest<T, S>(description: description);
}
