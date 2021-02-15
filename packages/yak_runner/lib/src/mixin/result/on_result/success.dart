import '../../../classes/all.dart';
import '../../../typedef/all.dart';

/// a `mixin` on `SuccessBase`
mixin OnSuccess<S> on SuccessBase<S> {
  ///  `onResult` implementation in case `Result` is `Success`
  Result<T> onResult<T>(Result<T> Function(S) runner, [FailureOfType<T> _]) =>
      runner(data);
}
