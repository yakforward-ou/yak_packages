import '../../mixin/all.dart';
import '../all.dart';
import 'base.dart';

abstract class Result<T> extends ResultBase<T> with WhenResult<T>, OnResult<T> {
  const factory Result.success(T data) = Success;
  const factory Result.failure(Object e, StackTrace s) = Failure;
}
