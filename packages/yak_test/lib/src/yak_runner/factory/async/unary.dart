import 'package:yak_runner/yak_runner.dart';
import '../../test/all.dart';

/// implementation of `YakRunnerTestFactoryDelegate` from `yak_runner`
class YakRunnerArgAsyncTestFactory implements YakRunnerArgTestFactoryDelegate {
  /// takes a `description` as argument
  const YakRunnerArgAsyncTestFactory(this.description);

  /// `description` is a `String`
  final String description;

  /// `call` is a `YakRunnerArgTestDelegate Function()`
  @override
  YakRunnerArgTestDelegate<T, S> call<T, S>() =>
      YakRunnerArgAsyncTest<T, S>(description: description);
}
