import 'package:yak_runner/yak_runner.dart';
import '../../test/all.dart';

/// implementation of `YakRunnerTestFactoryDelegate` from `yak_runner`
class YakRunnerTestFactory implements YakRunnerTestFactoryDelegate {
  /// takes a `description` as argument
  const YakRunnerTestFactory(this.description);

  /// `description` is a `String`
  final String description;

  /// `call` is a `YakRunnerTestDelegate Function()`
  @override
  YakRunnerTestDelegate<T> call<T>() =>
      YakRunnerTest<T>(description: description);
}
