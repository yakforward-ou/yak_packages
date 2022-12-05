import '../all.dart';

/// an utility extension that returns boolean for [Result] is [Success]
extension IsSuccessX<T> on Result<T> {
  bool get isSuccess => this is Success;
}

/// an utility extension that returns boolean for [Result] is [Failure]
extension IsFailureX<T> on Result<T> {
  bool get isFailure => this is Failure;
}
