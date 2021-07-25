import 'package:yak_result/yak_result.dart';

import '../../all.dart';

/// build a runner from a given result and a `RunnerBuilder`
extension BuildRunnerX<T, S> on Result<S> {
  /// returns a new runner generate using the incoming resuly
  RunnerFunction<T> buildRunner(RunnerBuilder<T, S> builder) {
    return this is Success ? builder(success) : () => failure.recast<T>();
  }

  /// returns a new runner generate using the incoming resuly
  RunnerAsyncFunction<T> buildRunnerAsync(RunnerBuilderAsync<T, S> builder) {
    return this is Success ? builder(success) : () async => failure.recast<T>();
  }
}
