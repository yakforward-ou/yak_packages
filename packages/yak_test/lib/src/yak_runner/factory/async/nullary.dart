import 'package:yak_runner/yak_runner.dart';
import '../../../all.dart';

/// implementation of `RunnerTestFactoryDelegate` from `yak_runner`
class RunnerAsyncTestFactory implements RunnerTestFactoryDelegate {
  /// takes a `description` as argument
  const RunnerAsyncTestFactory(this.description);

  /// `description` is a `String`
  final String description;

  /// `call` is a `RunnerTestDelegate Function()`
  @override
  RunnerTestDelegate<T> call<T>() =>
      RunnerAsyncTest<T>(description: description);
}
