import '../all.dart';

abstract class FailureBase<T> implements Result<T> {
  const FailureBase(this.e, this.s);
  final Object e;
  final StackTrace s;
}
