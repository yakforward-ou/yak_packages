import '../../../yak_runner.dart';

/// build a runner from a given result and a `RunnerBuilder`
extension BuildRunnerX<T, S> on Result<S> {
  /// returns a new runner generate using the incoming resuly
  RunnerFunction<T> buildRunner(RunnerBuilder<T, S> builder) {
    if (this is Success) {
      return builder((this as Success).data);
    } else {
      final failure = this as Failure;
      return () => Failure<T>(failure.e, failure.s);
    }
  }

  /// returns a new runner generate using the incoming resuly
  RunnerAsyncFunction<T> buildRunnerAsync(RunnerBuilderAsync<T, S> builder) {
    if (this is Success) {
      return builder((this as Success).data);
    } else {
      final failure = this as Failure;
      return () async => Failure<T>(failure.e, failure.s);
    }
  }
}
