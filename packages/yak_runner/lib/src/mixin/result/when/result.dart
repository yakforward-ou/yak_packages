import 'package:yak_error_handler/yak_error_handler.dart';

import '../../../classes/all.dart';

/// an `mixin` on `ResultBase`
mixin WhenResult<T> on ResultBase<T> {
  ///  `when` for an unspecified `Result`
  /// without an implementation
  Z when<Z>({
    required Z Function(T) success,
    required Z Function(ErrorReport report) failure,
  });
}
