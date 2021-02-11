import '../../mixin/all.dart';
import '../all.dart';
import 'base.dart';

/// abstract class implementing `ResultBase`
abstract class Result<T> extends ResultBase<T>
    with WhenResult<T>, OnResult<T>, OnResultAsync<T> {
  /// the constructor `Result.success` returns a `Success`
  const factory Result.success(T data) = Success;

  /// the constructor `Result.failure` returns a `Failure`
  const factory Result.failure(Object e, StackTrace s) = Failure;
}
