import '../../../yak_runner.dart';

/// cast a `Failure<S>` to a `Failure<T`
extension FailureToFailureOfTypeX<T, S> on Failure<S> {
  /// matches the typedef `FailureOfType<T>`
  Failure<T> ofType<T>() => Failure<T>(e, s);
}
