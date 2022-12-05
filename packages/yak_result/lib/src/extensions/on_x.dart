import 'package:yak_utils/yak_utils.dart';

import '../all.dart';

/// an utility extension that calls a [Unary<T, S>] when [Result<S>] `isSuccess`
extension OnSuccessX<T, S> on Result<S> {
  T? onSuccess(Unary<T, S> function) => isSuccess ? function(success) : null;
}

/// an utility extension that calls a [UnaryVoid<Failure<S>]
/// when [Result<S>] `isFailure`
extension OnFailureX<T, S> on Result<S> {
  void onFailure(UnaryVoid<Failure<S>> function) =>
      isFailure ? function(failure) : null;
}
