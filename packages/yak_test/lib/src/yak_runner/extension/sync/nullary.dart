import 'package:yak_runner/yak_runner.dart';
import '../../../yak_runner/factory/all.dart';

/// an extension on `Runner`
extension RunnerFactoryExtension on Runner {
  /// `buildTestFactory` returns `RunnerTestFactory`
  RunnerTestFactory buildTestFactory(String description) =>
      RunnerTestFactory(description);
}
