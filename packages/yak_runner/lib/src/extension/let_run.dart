import 'package:yak_result/yak_result.dart';
import 'package:yak_utils/yak_utils.dart';
import '../all.dart';

/// syntactic sugar to pass a [ValueResult] to a [ResultUnary]
extension ValueResultLetRunX<S> on ValueResult<S> {
  ValueResult<T> letRun<T>(Unary<T, S> function) =>
      isSuccess ? function.run(success.value) : failure.recast<T>();

  VoidResult<void> letRunVoid(Unary<void, S> function) =>
      isSuccess ? function.runVoid(success.value) : failure.recast();
}

/// syntactic sugar to pass a [VoidResult] to a [ResultNullary]
extension VoidResultLetRunX on VoidResult {
  ValueResult<T> letRun<T>(Nullary<T> function) =>
      isSuccess ? function.run() : failure.recast<T>();

  VoidResult<void> letRunVoid<T>(Nullary<T> function) =>
      isSuccess ? function.runVoid() : failure.recast();
}
