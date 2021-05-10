import 'package:yak_error_handler/yak_error_handler.dart';

import '../../../yak_runner.dart';

/// following line added because [https://stackoverflow.com/questions/66315301/what-is-the-correct-way-to-catch-both-error-and-exception-following-effective-d]
//  ignore_for_file: avoid_catching_errors

/// a class that takes `T Function()`
/// and returns `Result<T> Function()`
/// on `Exception` invokes `errorHandler` if not null
class Runner<T> extends RunnerBase<T> implements NullaryDelegate<Result<T>> {
  /// takes as argument `fun` and `errorHandler`
  const Runner(
    this.fun, {
    HandleError<ErrorReport>? errorReport,
    Set<ErrorHandler> errorHandlers = const {},
    List<OnSuccessCallback<T>> onSuccess = const [],
  }) :
        // coverage:ignore-line
        super(
          errorReport: errorReport,
          errorHandlers: errorHandlers,
          onSuccess: onSuccess,
        );

  /// `fun` is `T Function()`
  final T Function() fun;

  /// `call` is a `Result<T> Function()`
  Result<T> call() {
    try {
      final data = fun();
      for (final callback in onSuccess) {
        callback(data);
      }
      return Result.success(data);
    } on Error catch (e) {
      for (final handler in errorHandlers) {
        final err = handler(e);
        if (err != null) {
          final report = err.report;
          if (handler.report) {
            errorReport?.call(report);
          }
          return Result.failure(report);
        }
      }
      rethrow;
    } on Exception catch (e, s) {
      final report = ErrorReport(message: e, stackTrace: s);
      errorReport?.call(report);
      return Result.failure(report);
    }
  }
}
