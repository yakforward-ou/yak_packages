import 'package:yak_utils/yak_utils.dart';

import '../all.dart';

extension OnSuccessX<T, S> on Result<S> {
  T? onSuccess(Unary<T, S> function) => isSuccess ? function(success) : null;
}

extension OnFailureX<T, S> on Result<S> {
  T? onSuccess(Unary<T, Failure<S>> function) =>
      isFailure ? function(failure) : null;
}

extension OnPendingX<T, S> on Result<S> {
  T? onSuccess(VoidCallback function) => isFailure ? function(failure) : null;
}
