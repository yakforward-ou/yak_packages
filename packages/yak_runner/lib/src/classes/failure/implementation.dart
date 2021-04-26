import 'package:yak_error_handler/yak_error_handler.dart';

import '../../all.dart';
import 'base.dart';

/// class extending `FailureBase`
class Failure<T> extends FailureBase<T>
    with WhenFailure<T>, OnFailure<T>, OnFailureAsync<T> {
  /// `Failure`  has argument `ErrorReport` `report`
  const Failure(ErrorReport report) : super(report);
}
