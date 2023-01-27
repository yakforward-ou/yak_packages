import '../all.dart';

/// syntactic sugar to easily access the data of a sucessful [ValueResult]
extension ValueResultAsSuccess<T> on ValueResult<T> {
  ValueSuccess<T> get success => isSuccess
      ? this as ValueSuccess<T>
      : throw Exception('Result is a Failure');

  ValueSuccess<T>? get successOrNull =>
      isSuccess ? this as ValueSuccess<T> : null;
}

/// syntactic sugar to easily access the data of a sucessful [VoidResult]
extension VoidResultAsSuccess on VoidResult {
  VoidSuccess<void> get success =>
      isSuccess ? this as VoidSuccess : throw Exception('Result is a Failure');

  VoidSuccess<void>? get successOrNull =>
      isSuccess ? this as VoidSuccess : null;
}
