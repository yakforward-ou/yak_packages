import 'package:yak_error_handler/yak_error_handler.dart';

import '../../../classes/all.dart';

/// a `mixin` on `FailureBase`
mixin WhenFailure<T> on FailureBase<T> {
  ///  `when` implementation in case `Result` is `Failure`
  Z when<Z>({
    required Z Function(T) success,
    required Z Function(ErrorReport report) failure,
  }) =>
      failure.call(report);
}
