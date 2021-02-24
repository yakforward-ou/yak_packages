import 'dart:async';
import '../../all.dart';

/// following line added because [https://stackoverflow.com/questions/66315301/what-is-the-correct-way-to-catch-both-error-and-exception-following-effective-d]
//  ignore_for_file: avoid_catching_errors

/// a class that takes a `Future<T> Function(FutureOr<S>)`
/// and returns `Future<Result<T>> Function(FutureOr<S>)`
/// on `Exception` invokes `errorHandler` if not null
class YakRunnerArgAsync<T, S> extends YakRunnerBase
    with YakRunnerArgTestMixin<T, S>
    implements UnaryDelegate<Future<Result<T>>, FutureOr<S>> {
  /// takes as argument `fun` and `errorHandler`
  YakRunnerArgAsync(
    this.fun, {
    HandleException handleException,
    Set<HandleErrorBase> errorsWhitelist = const {},
  })  : assert(fun != null, ' a non null function must be provided'),
        assert(S != typeVoid, '`S` must not be of type `void`'),
        // coverage:ignore-line
        super(
          handleException: handleException,
          errorsWhitelist: errorsWhitelist,
        );

  /// `fun` is ` Future<T> Function(FutureOr<S>)`
  final Future<T> Function(FutureOr<S>) fun;

  /// `call` is a  `Future<Result<T>> Function(FutureOr<S>)`
  Future<Result<T>> call(FutureOr<S> arg) async {
    assert(arg != null, ' a non null `arg` must be provided');

    try {
      return Result.success(await fun(await arg));
    } on Error catch (e) {
      for (final err in errorsWhitelist) {
        if (err.type != e.runtimeType) {
          err(e);
          return Result.failure(e, e.stackTrace);
        }
      }
      rethrow;
    } on Exception catch (e, s) {
      handleException?.call(e, s);
      return Result.failure(e, s);
    }
  }
}
