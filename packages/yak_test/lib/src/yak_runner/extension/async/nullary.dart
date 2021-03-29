import 'package:yak_runner/yak_runner.dart';
import '../../../yak_runner/factory/all.dart';

/// an extension on `RunnerAsync`
extension RunnerAsyncFactoryExtension on RunnerAsync {
  /// `buildTestFactory` returns `RunnerAsyncTestFactory`
  RunnerAsyncTestFactory buildTestFactory(String description) =>
      RunnerAsyncTestFactory(description);
}
