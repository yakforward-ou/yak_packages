import 'package:yak_error_handler/yak_error_handler.dart';

import '../../../yak_runner.dart';

/// return a `Runner<T>` that holds the same function
/// but replaces the provided arguments
extension RunnerCopyWithX<T> on Runner<T> {
  /// replaces `errorHandlers` , `OnSuccessCallback`and
  /// `HandleExceptionDelegate` with a new one, if provided
  Runner<T> copyWith({
    HandleExceptionDelegate? exceptionHandler,
    Set<ErrorHandler>? errorHandlers,
    List<OnSuccessCallback<T>>? onSuccess,
  }) {
    return Runner<T>(
      fun,
      errorHandlers: errorHandlers ?? this.errorHandlers,
      onSuccess: onSuccess ?? this.onSuccess,
      exceptionHandler: exceptionHandler ?? this.exceptionHandler,
    );
  }
}

/// return a `RunnerAsync<T>` that holds the same function
/// but changes other argumets arguments
extension RunnerAsyncCopyWithX<T> on RunnerAsync<T> {
  /// replaces `errorHandlers` , `OnSuccessCallback`and
  /// `HandleExceptionDelegate` with a new one, if provided
  RunnerAsync<T> copyWith({
    HandleExceptionDelegate? exceptionHandler,
    Set<ErrorHandler>? errorHandlers,
    List<OnSuccessCallback<T>>? onSuccess,
  }) {
    return RunnerAsync<T>(
      fun,
      errorHandlers: errorHandlers ?? this.errorHandlers,
      onSuccess: onSuccess ?? this.onSuccess,
      exceptionHandler: exceptionHandler ?? this.exceptionHandler,
    );
  }
}

/// return a `UnaryRunner<T,S>` that holds the same function
/// but changes other argumets arguments
extension UnaryRunnerCopyWithX<T, S> on UnaryRunner<T, S> {
  /// replaces `errorHandlers` , `OnSuccessCallback`and
  /// `HandleExceptionDelegate` with a new one, if provided
  UnaryRunner<T, S> copyWith({
    HandleExceptionDelegate? exceptionHandler,
    Set<ErrorHandler>? errorHandlers,
    List<OnSuccessCallback<T>>? onSuccess,
  }) {
    return UnaryRunner<T, S>(
      fun,
      errorHandlers: errorHandlers ?? this.errorHandlers,
      onSuccess: onSuccess ?? this.onSuccess,
      exceptionHandler: exceptionHandler ?? this.exceptionHandler,
    );
  }
}

/// return a `UnaryRunnerAsync<T,S>` that holds the same function
/// but changes other argumets arguments
extension UnaryRunnerAsyncCopyWithX<T, S> on UnaryRunnerAsync<T, S> {
  /// replaces `errorHandlers` , `OnSuccessCallback`and
  /// `HandleExceptionDelegate` with a new one, if provided
  UnaryRunnerAsync<T, S> copyWith({
    HandleExceptionDelegate? exceptionHandler,
    Set<ErrorHandler>? errorHandlers,
    List<OnSuccessCallback<T>>? onSuccess,
  }) {
    return UnaryRunnerAsync<T, S>(
      fun,
      errorHandlers: errorHandlers ?? this.errorHandlers,
      onSuccess: onSuccess ?? this.onSuccess,
      exceptionHandler: exceptionHandler ?? this.exceptionHandler,
    );
  }
}
