import '../all.dart';
import '../../mixin/when/all.dart';
import 'base.dart';

abstract class Result<T> extends ResultBase<T> with WhenResultBase<T> {
  const factory Result.success(T data) = Success;
  const factory Result.failure(Object e, StackTrace s) = Failure;
}
