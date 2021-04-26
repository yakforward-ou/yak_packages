import '../../../yak_runner.dart';

/// return a `Runner<T>` that holds the same function
/// but changes other argumets arguments
extension RunnerAppendX<T> on Runner<T> {
  /// adds `errorHandlers` and `OnSuccessCallback` to the existing one
  Runner<T> append({
    Set<ErrorHandler> errorHandlers = const {},
    List<OnSuccessCallback<T>> onSuccess = const [],
  }) {
    return Runner<T>(
      fun,
      errorHandlers: {...errorHandlers, ...this.errorHandlers},
      onSuccess: [...onSuccess, ...this.onSuccess],
      errorReport: errorReport,
    );
  }
}

/// return a `RunnerAsync<T>` that holds the same function
/// but changes other argumets arguments
extension RunnerAsyncAppendX<T> on RunnerAsync<T> {
  /// adds `errorHandlers` and `OnSuccessCallback` to the existing one
  RunnerAsync<T> append({
    Set<ErrorHandler> errorHandlers = const {},
    List<OnSuccessCallback<T>> onSuccess = const [],
  }) {
    return RunnerAsync<T>(
      fun,
      errorHandlers: {...errorHandlers, ...this.errorHandlers},
      onSuccess: [...onSuccess, ...this.onSuccess],
      errorReport: errorReport,
    );
  }
}

/// return a `UnaryRunner<T,S>` that holds the same function
/// but changes other argumets arguments
extension UnaryRunnerAppendX<T, S> on UnaryRunner<T, S> {
  /// adds `errorHandlers` and `OnSuccessCallback` to the existing one
  UnaryRunner<T, S> append({
    Set<ErrorHandler> errorHandlers = const {},
    List<OnSuccessCallback<T>> onSuccess = const [],
  }) {
    return UnaryRunner<T, S>(
      fun,
      errorHandlers: {...errorHandlers, ...this.errorHandlers},
      onSuccess: [...onSuccess, ...this.onSuccess],
      errorReport: errorReport,
    );
  }
}

/// return a `UnaryRunnerAsync<T,S>` that holds the same function
/// but changes other argumets arguments
extension UnaryRunnerAsyncAppendX<T, S> on UnaryRunnerAsync<T, S> {
  /// adds `errorHandlers` and `OnSuccessCallback` to the existing one
  UnaryRunnerAsync<T, S> append({
    Set<ErrorHandler> errorHandlers = const {},
    List<OnSuccessCallback<T>> onSuccess = const [],
  }) {
    return UnaryRunnerAsync<T, S>(
      fun,
      errorHandlers: {...errorHandlers, ...this.errorHandlers},
      onSuccess: [...onSuccess, ...this.onSuccess],
      errorReport: errorReport,
    );
  }
}
