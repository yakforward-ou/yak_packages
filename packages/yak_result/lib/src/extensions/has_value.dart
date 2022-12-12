import '../all.dart';

/// an utility extension that returns boolean
/// for [Result] is [ValueResult] and not a [Failure]
extension ResultHasValueX<T> on Result<T> {
  bool get hasValue => isSuccess ? this is ValueResult<T> : false;
}
