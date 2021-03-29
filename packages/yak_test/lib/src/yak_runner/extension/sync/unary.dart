import 'package:yak_runner/yak_runner.dart';
import '../../../yak_runner/factory/all.dart';

/// an extension on `UnaryRunner`
extension UnaryRunnerFactoryExtension on UnaryRunner {
  /// `buildTestFactory` returns `RunnerTestFactory`
  UnaryRunnerTestFactory buildTestFactory(String description) =>
      UnaryRunnerTestFactory(description);
}
