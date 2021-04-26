import 'package:yak_error_handler/yak_error_handler.dart';

import '../all.dart';

/// abstract class implementing `Result`
abstract class FailureBase<T> implements Result<T> {
  /// `FailureBase` has argument `ErrorReport` `report`
  const FailureBase(this.report);

  /// holds an `ErrorReport`
  final ErrorReport report;
}
