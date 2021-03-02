import '../../all.dart';
import 'base.dart';

/// class extending `FailureBase`
class Failure<T> extends FailureBase<T>
    with WhenFailure<T>, OnFailure<T>, OnFailureAsync<T> {
  /// `Failure` has argument `Object` `e` and `StackTrace` `s`
  const Failure(Object e, StackTrace? s) : super(e, s);
}
