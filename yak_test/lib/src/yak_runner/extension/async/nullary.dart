import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

extension YakRunnerAsyncFactoryExtension on YakRunnerAsync {
  YakRunnerTestFactoryDelegate buildTestFactory(String description) =>
      YakRunnerAsyncTestFactory(description);
}
