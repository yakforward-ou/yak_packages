import '../all.dart';

/// abstract class implementing `Result`
abstract class SuccessBase<T> implements Result<T> {
  /// `SuccessBase` has argument `data` of type `T`
  const SuccessBase(this.data);

  /// `T` `data` stores the value of a `SuccessBase`
  final T data;
}
