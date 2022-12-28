import '../all.dart';

/// syntactic sugar to cast a [ValueResult] to [VoidResult]
extension ValueResultAsVoidX<T> on ValueResult<T> {
  VoidResult<void> get asVoid =>
      isFailure ? failure.recast() : const VoidSuccess<void>();
}
