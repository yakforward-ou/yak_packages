import 'package:yak_runner/yak_runner.dart';
import '../../test/all.dart';

class YakRunnerArgTestFactory implements YakRunnerArgTestFactoryDelegate {
  const YakRunnerArgTestFactory(this.description);
  final String description;
  @override
  YakRunnerArgTestDelegate<T, S> call<T, S>() =>
      YakRunnerArgTest<T, S>(description: description);
}
