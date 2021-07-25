import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_result/yak_result.dart';

/// converts an ErrorReport to a Failure
extension ErrorReportToFailureX on ErrorReport {
  /// a message can be passed as parameter
  Failure<T> toFailure<T>([String? message]) {
    return Failure(reason: report, stackTrace: stackTrace, message: message);
  }
}
