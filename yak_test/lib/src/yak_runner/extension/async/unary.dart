import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

// an extension on `YakRunnerArgAsync` that returns `YakRunnerAsyncTestFactory`

extension YakRunnerArgAsyncFactoryExtension on YakRunnerArgAsync {
  YakRunnerArgAsyncTestFactory buildTestFactory(String description) =>
      YakRunnerArgAsyncTestFactory(description);
}
