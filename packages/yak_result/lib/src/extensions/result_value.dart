import '../all.dart';

// TODO implement [ValueResult] [VoidResult] specific to improve performance

/// syntactic sugar to easily access the data of a successful [ValueResult]
extension ResultValueX<T> on Result<T> {
  /// the user takes responsability on the result being a Success
  T get value => isSuccess
      ? hasValue
          ? (this as ValueSuccess<T>).value
          : throw Exception('Result is a Success, but has no value')
      : throw Exception('Result<$T> is a Failure');

  T? get valueOrNull => isSuccess
      ? hasValue
          ? (this as ValueSuccess<T>).value
          : null
      : null;
}
