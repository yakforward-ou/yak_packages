import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

extension YakRunnerFactoryExtension on YakRunner {
  YakRunnerTestFactoryDelegate buildTestFactory(String description) =>
      YakRunnerTestFactory(description);
}
