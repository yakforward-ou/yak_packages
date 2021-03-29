import 'package:yak_runner/yak_runner.dart';
import '../../../yak_runner/factory/all.dart';

/// an extension on `UnaryRunnerAsync`
extension UnaryRunnerAsyncFactoryExtension on UnaryRunnerAsync {
  /// `buildTestFactory` returns `RunnerAsyncTestFactory`
  UnaryRunnerAsyncTestFactory buildTestFactory(String description) =>
      UnaryRunnerAsyncTestFactory(description);
}
