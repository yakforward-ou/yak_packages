import 'package:yak_runner/yak_runner.dart';
import '../../../all.dart';

/// implementation of `RunnerTestFactoryDelegate` from `yak_runner`
class UnaryRunnerTestFactory implements UnaryRunnerTestFactoryDelegate {
  /// takes a `description` as argument
  const UnaryRunnerTestFactory(this.description);

  /// `description` is a `String`
  final String description;

  /// `call` is a `RunnerTestDelegate Function()`
  @override
  UnaryRunnerTestDelegate<T, S> call<T, S>() =>
      UnaryRunnerTest<T, S>(description: description);
}
