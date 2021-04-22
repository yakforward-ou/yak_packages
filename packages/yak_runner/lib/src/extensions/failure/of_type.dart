import '../../../yak_runner.dart';
//  ignore_for_file: avoid_shadowing_type_parameters

/// cast a `Failure<S>` to a `Failure<T`
extension FailureToFailureOfTypeX<T, S> on Failure<S> {
  /// matches the typedef `FailureOfType<T>`
  Failure<T> ofType<T>() => Failure(e, s);
}
