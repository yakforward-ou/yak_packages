import '../all.dart';

/// an utility extension that returns boolean for [Result] is [Success]
extension IsSuccessX on Result {
  bool get isSuccess => this is Success;
}

/// an utility extension that returns boolean for [Result] is [Failure]
extension IsFailureX on Result {
  bool get isFailure => this is Failure;
}
