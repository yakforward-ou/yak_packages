import 'dart:async';
import 'package:yak_error_handler/yak_error_handler.dart';

import '../../all.dart';

/// following line added because [https://stackoverflow.com/questions/66315301/what-is-the-correct-way-to-catch-both-error-and-exception-following-effective-d]
//  ignore_for_file: avoid_catching_errors

/// a class that takes a `Future<T> Function(FutureOr<S>)`
/// and returns `Future<Result<T>> Function(FutureOr<S>)`
/// on `Exception` invokes `errorHandler` if not null
class UnaryRunnerAsync<T, S> extends RunnerBase<T>
    with UnaryRunnerTestMixin<T, S>
    implements UnaryDelegate<Future<Result<T>>, FutureOr<S>> {
  /// takes as argument `fun` and `errorHandler`
  UnaryRunnerAsync(
    this.fun, {
    HandleExceptionDelegate? exceptionHandler,
    Set<ErrorHandler> errorHandlers = const {},
    List<OnSuccessCallback<T>> onSuccess = const [],
  })  : assert(S != typeVoid, '`S` must not be of type `void`'),
        // coverage:ignore-line
        super(
            exceptionHandler: exceptionHandler,
            errorHandlers: errorHandlers,
            onSuccess: onSuccess);

  /// `fun` is ` Future<T> Function(FutureOr<S>)`
  final Future<T> Function(FutureOr<S>) fun;

  /// `call` is a  `Future<Result<T>> Function(FutureOr<S>)`
  Future<Result<T>> call(FutureOr<S> arg) async {
    try {
      final data = await fun(await arg);
      for (final callback in onSuccess) {
        await callback(data);
      }
      return Result.success(data);
    } on Error catch (e) {
      for (final h in errorHandlers) {
        if (e.runtimeType == h.type) {
          h.handleError(e);
          return Result.failure(e, e.stackTrace);
        }
      }
      rethrow;
    } on Exception catch (e, s) {
      exceptionHandler?.call(e, s);
      return Result.failure(e, s);
    }
  }
}
