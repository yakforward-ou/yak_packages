import 'package:yak_runner/yak_runner.dart';
import '../../../yak_runner/factory/all.dart';

/// an extension on `YakRunnerArg`
extension YakRunnerArgFactoryExtension on YakRunnerArg {
  /// `buildTestFactory` returns `YakRunnerTestFactory`
  YakRunnerArgTestFactory buildTestFactory(String description) =>
      YakRunnerArgTestFactory(description);
}
