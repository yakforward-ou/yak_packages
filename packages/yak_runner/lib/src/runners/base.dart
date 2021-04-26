import 'package:yak_error_handler/yak_error_handler.dart';

import '../../yak_runner.dart';

/// an interface for `yak_runner` class
abstract class RunnerBase<T> {
  /// a function of typedef `HandleException`
  final HandleError<ErrorReport>? errorReport;

  /// a set of specific to handle in a predetermined way
  final Set<ErrorHandler> errorHandlers;

  /// a list of `callback`s to triggers in case of `Success`
  final List<OnSuccessCallback<T>> onSuccess;

  /// the constructor takes an optional parameter `exceptionHandler`
  const RunnerBase({
    this.errorReport,
    required this.errorHandlers,
    required this.onSuccess,
  });
}
