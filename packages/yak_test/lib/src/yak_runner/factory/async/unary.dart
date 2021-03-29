import 'package:yak_runner/yak_runner.dart';
import '../../../all.dart';

/// implementation of `RunnerTestFactoryDelegate` from `yak_runner`
class UnaryRunnerAsyncTestFactory implements UnaryRunnerTestFactoryDelegate {
  /// takes a `description` as argument
  const UnaryRunnerAsyncTestFactory(this.description);

  /// `description` is a `String`
  final String description;

  /// `call` is a `UnaryRunnerTestDelegate Function()`
  @override
  UnaryRunnerTestDelegate<T, S> call<T, S>() =>
      UnaryRunnerAsyncTest<T, S>(description: description);
}
