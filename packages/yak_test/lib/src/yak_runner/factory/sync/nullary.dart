import 'package:yak_runner/yak_runner.dart';
import '../../../all.dart';

/// implementation of `RunnerTestFactoryDelegate` from `yak_runner`
class RunnerTestFactory implements RunnerTestFactoryDelegate {
  /// takes a `description` as argument
  const RunnerTestFactory(this.description);

  /// `description` is a `String`
  final String description;

  /// `call` is a `RunnerTestDelegate Function()`
  @override
  RunnerTestDelegate<T> call<T>() => RunnerTest<T>(description: description);
}
