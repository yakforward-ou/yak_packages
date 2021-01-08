import '../../mixin/when/all.dart';
import 'base.dart';

class Failure<T> extends FailureBase<T> with WhenFailure<T> {
  const Failure(Object e, StackTrace s) : super(e, s);
}
