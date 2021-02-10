import 'package:yak_runner/yak_runner.dart';
import '../../../yak_runner/factory/all.dart';

/// an extension on `YakRunnerAsync`
extension YakRunnerAsyncFactoryExtension on YakRunnerAsync {
  /// `buildTestFactory` returns `YakRunnerAsyncTestFactory`
  YakRunnerAsyncTestFactory buildTestFactory(String description) =>
      YakRunnerAsyncTestFactory(description);
}
