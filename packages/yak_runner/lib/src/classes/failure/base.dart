import '../all.dart';

/// abstract class implementing `Result`
abstract class FailureBase<T> implements Result<T> {
  /// `FailureBase` has argument `Object` `e` and `StackTrace` `s`
  const FailureBase(this.e, this.s);

  /// `e` is the `Exception` or `Error` body
  final Object e;

  /// `s` a possibly `null` `Stacktrace`
  final StackTrace? s;
}
