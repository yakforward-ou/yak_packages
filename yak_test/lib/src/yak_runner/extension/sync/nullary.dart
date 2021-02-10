import 'package:yak_runner/yak_runner.dart';
import '../../../yak_runner/factory/all.dart';

/// an extension on `YakRunner`
extension YakRunnerFactoryExtension on YakRunner {
  /// `buildTestFactory` returns `YakRunnerTestFactory`
  YakRunnerTestFactory buildTestFactory(String description) =>
      YakRunnerTestFactory(description);
}
