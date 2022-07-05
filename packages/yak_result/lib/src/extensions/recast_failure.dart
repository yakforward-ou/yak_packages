import '../all.dart';

/// cast a `Failure<S>` to a `Failure<T>`
extension RecastFailureX on Failure {
  /// re-case the failure in the expected type
  Failure<T> recast<T>() => Failure(reason: reason, stackTrace: stackTrace);

  /// return an `Exception` with the `Failure` as `message`
  Exception get asException => Exception('$this');
}
