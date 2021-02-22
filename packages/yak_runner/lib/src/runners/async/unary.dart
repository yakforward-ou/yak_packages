import 'dart:async';
import '../../classes/all.dart';
import '../../delegates/all.dart';
import '../../mixin/all.dart';
import '../../shared/all.dart';
import '../../typedef/all.dart';

/// following line added because [https://stackoverflow.com/questions/66315301/what-is-the-correct-way-to-catch-both-error-and-exception-following-effective-d]
//  ignore_for_file: avoid_catches_without_on_clauses

/// a class that takes a `Future<T> Function(FutureOr<S>)`
/// and returns `Future<Result<T>> Function(FutureOr<S>)`
/// on `Exception` invokes `errorHandler` if not null
class YakRunnerArgAsync<T, S>
    with YakRunnerArgTestMixin<T, S>
    implements UnaryDelegate<Future<Result<T>>, FutureOr<S>> {
  /// takes as argument `fun` and `errorHandler`
  YakRunnerArgAsync(
    this.fun, [
    this.errorHandler,
  ])  : assert(fun != null, ' a non null function must be provided'),
        assert(S != typeVoid, '`S` must not be of type `void`');

  /// `fun` is ` Future<T> Function(FutureOr<S>)`
  final Future<T> Function(FutureOr<S>) fun;

  /// `errorHandler` is `Catch` typedef
  final Catch errorHandler;

  /// `call` is a  `Future<Result<T>> Function(FutureOr<S>)`
  Future<Result<T>> call(FutureOr<S> arg) async {
    assert(arg != null, ' a non null `arg` must be provided');

    try {
      return Result.success(await fun(await arg));
    } catch (e, s) {
      errorHandler?.call(e, s);
      return Result.failure(e, s);
    }
  }
}
