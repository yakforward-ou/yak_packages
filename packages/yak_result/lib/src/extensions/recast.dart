import '../classes/failure.dart';
import '../classes/result.dart' show Result;
import '../classes/void_result.dart' show VoidResult;

/// recast a [Failure] with to the desired [Type]
extension RecastFailureX<T> on Failure<T> {
  Result<S> recast<S extends Object>() => Result.failure(
        reason,
        stackTrace,
      );
  VoidResult asVoid() => VoidResult.failure(
        reason,
        stackTrace,
      );
}

/// recast a [Result] with to the desired [Type]
extension RecastSuccessX<T extends Object> on Result<T> {
  VoidResult asVoid() => isSuccess
      ? const VoidResult.success()
      : () {
          final failure = result as Failure<T>;
          return VoidResult.failure(failure.reason, failure.stackTrace);
        }();
}
