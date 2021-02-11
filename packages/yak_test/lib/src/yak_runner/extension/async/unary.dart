import 'package:yak_runner/yak_runner.dart';
import '../../../yak_runner/factory/all.dart';

/// an extension on `YakRunnerArgAsync`
extension YakRunnerArgAsyncFactoryExtension on YakRunnerArgAsync {
  /// `buildTestFactory` returns `YakRunnerAsyncTestFactory`
  YakRunnerArgAsyncTestFactory buildTestFactory(String description) =>
      YakRunnerArgAsyncTestFactory(description);
}
