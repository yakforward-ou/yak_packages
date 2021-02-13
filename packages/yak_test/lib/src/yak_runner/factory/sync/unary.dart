import 'package:yak_runner/yak_runner.dart';
import '../../../all.dart';

/// implementation of `YakRunnerTestFactoryDelegate` from `yak_runner`
class YakRunnerArgTestFactory implements YakRunnerArgTestFactoryDelegate {
  /// takes a `description` as argument
  const YakRunnerArgTestFactory(this.description);

  /// `description` is a `String`
  final String description;

  /// `call` is a `YakRunnerTestDelegate Function()`
  @override
  YakRunnerArgTestDelegate<T, S> call<T, S>() =>
      YakRunnerArgTest<T, S>(description: description);
}
