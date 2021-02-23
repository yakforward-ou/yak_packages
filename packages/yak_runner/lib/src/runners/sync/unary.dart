import '../../all.dart';

/// following line added because [https://stackoverflow.com/questions/66315301/what-is-the-correct-way-to-catch-both-error-and-exception-following-effective-d]
//  ignore_for_file: avoid_catching_errors

/// a class that takes `T Function(S)`
/// and returns `Result<T> Function(S)`
/// on `Exception` invokes `errorHandler` if not null
class YakRunnerArg<T, S> extends YakRunnerBase
    with YakRunnerArgTestMixin<T, S>
    implements UnaryDelegate<Result<T>, S> {
  /// takes as argument `fun` and `errorHandler`
  YakRunnerArg(
    this.fun, [
    CatchException errorHandler,
  ])  : assert(fun != null, ' a non null function must be provided'),
        assert(S != typeVoid, '`S` must not be of type `void`'),
        // coverage:ignore-line
        super(errorHandler);

  /// `fun` is ` T Function(S)`
  final T Function(S) fun;

  /// `call` is a  `Result<T> Function(S)`
  Result<T> call(S arg) {
    assert(arg != null, ' a non null `arg` must be provided');
    try {
      return Result.success(fun(arg));
    } on Error catch (e) {
      errorHandler?.call(Exception('$e'), e.stackTrace);
      rethrow;
    } on Exception catch (e, s) {
      errorHandler?.call(e, s);
      return Result.failure(e, s);
    }
  }
}
