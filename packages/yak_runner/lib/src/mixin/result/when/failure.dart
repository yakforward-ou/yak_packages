import 'package:meta/meta.dart';
import '../../../classes/all.dart';

/// a `mixin` on `FailureBase`
mixin WhenFailure<T> on FailureBase<T> {
  ///  `when` implementation in case `Result` is `Failure`
  Z when<Z>({
    @required Z Function(T) success,
    @required Z Function(Object, StackTrace) failure,
  }) =>
      failure?.call(e, s);
}
