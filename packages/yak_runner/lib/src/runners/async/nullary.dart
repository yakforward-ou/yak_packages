import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_result/yak_result.dart';

import '../../all.dart';

/// following line added because [https://stackoverflow.com/questions/66315301/what-is-the-correct-way-to-catch-both-error-and-exception-following-effective-d]
//  ignore_for_file: avoid_catching_errors

/// a class that takes `Future<T> Function()`
/// and returns `Future<Result<T>> Function()`
/// on `Exception` invokes `errorHandler` if not null
class RunnerAsync<T> extends RunnerBase<T>
    implements NullaryDelegate<Future<Result<T>>> {
  /// takes as argument `fun` and `errorHandler`
  const RunnerAsync(
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

  /// `fun` is `Future<T> Function()`
  final Future<T> Function() fun;

  /// `call` is a `Future<Result<T>> Function()`
  Future<Result<T>> call() async {
    try {
      final data = await fun();
      for (final callback in onSuccess) {
        await callback(data);
      }
      return Success(data);
    } on Error catch (e) {
      for (final handler in errorHandlers) {
        final err = handler(e);
        if (err != null) {
          final report = err.report;
          if (handler.report) {
            errorReport?.call(report);
          }
          if (handler.shouldRethrow) {
            rethrow;
          }
          return report.toFailure();
        }
      }
      rethrow;
    } on Exception catch (e, s) {
      final report = ErrorReport(report: e, stackTrace: s);
      errorReport?.call(report);
      return report.toFailure();
    }
  }
}
