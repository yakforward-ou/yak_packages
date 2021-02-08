import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

// an extension on `YakRunnerAsync` that returns `YakRunnerAsyncTestFactory`

extension YakRunnerAsyncFactoryExtension on YakRunnerAsync {
  YakRunnerAsyncTestFactory buildTestFactory(String description) =>
      YakRunnerAsyncTestFactory(description);
}
