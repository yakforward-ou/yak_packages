import '../../mixin/all.dart';
import 'base.dart';

class Failure<T> extends FailureBase<T>
    with WhenFailure<T>, OnFailure<T>, OnFailureAsync<T> {
  const Failure(Object e, StackTrace s) : super(e, s);
}
