import '../all.dart';

/// syntactic sugar to cast a [Result] to [VoidResult]
extension ValueResultAsVoidX on Result {
  VoidResult<void> get asVoid =>
      isFailure ? failure.recast() : const VoidSuccess<void>();
}
