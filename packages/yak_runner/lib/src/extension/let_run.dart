import 'package:yak_result/yak_result.dart';
import 'package:yak_utils/yak_utils.dart';
import 'run.dart';

/// syntactic sugar to pass a [Result] to a [ResultUnary]
extension ResultLetRunX<S extends Object> on Result<S> {
  Result<T> letRun<T extends Object>(Unary<T, S> function) =>
      isSuccess ? function.run(asSuccess) : asFailure.recast<T>();

  VoidResult letRunVoid<T>(Unary<T, S> function) =>
      isSuccess ? function.runVoid(asSuccess) : asFailure.asVoid();
}

/// syntactic sugar to pass a [VoidResult] to a [ResultNullary]
extension VoidResultLetRunX on VoidResult {
  Result<T> letRun<T extends Object>(Nullary<T> function) =>
      isSuccess ? function.run() : asFailure.recast<T>();

  VoidResult letRunVoid<T extends Object>(Nullary<T> function) =>
      isSuccess ? function.runVoid() : asFailure.asVoid();
}
