import '../all.dart';

/// abstract class implementing `Result`
abstract class FailureBase<T> implements Result<T> {
  /// `FailureBase` has argument `Object` `e` and `StackTrace` `s`
  const FailureBase(this.e, this.s);

  /// `Object` `e` is for the `error`'s body
  final Object e;

  /// `StackTrace` `s`is for the `error`'s stacktrace
  final StackTrace s;
}
