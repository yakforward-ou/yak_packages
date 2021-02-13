import 'package:yak_runner/yak_runner.dart';
import '../../../all.dart';

/// implementation of `YakRunnerTestFactoryDelegate` from `yak_runner`
class YakRunnerAsyncTestFactory implements YakRunnerTestFactoryDelegate {
  /// takes a `description` as argument
  const YakRunnerAsyncTestFactory(this.description);

  /// `description` is a `String`
  final String description;

  /// `call` is a `YakRunnerTestDelegate Function()`
  @override
  YakRunnerTestDelegate<T> call<T>() =>
      YakRunnerAsyncTest<T>(description: description);
}
