import 'package:yak_error_handler/yak_error_handler.dart';

import '../../../../yak_runner.dart';

/// a `mixin` on `SuccessBase`
mixin WhenSuccess<T> on SuccessBase<T> {
  ///  `when` implementation in case `Result` is `Success`
  Z when<Z>({
    required Z Function(T) success,
    required Z Function(ErrorReport report) failure,
  }) =>
      success(data);
}
