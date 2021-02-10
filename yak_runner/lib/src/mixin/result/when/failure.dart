import 'package:meta/meta.dart';
import '../../../classes/all.dart';

/// a `mixin` on `FailureBase`
mixin WhenFailure<T> on FailureBase<T> {
  ///  `when` implementation in case `Result` is `Failure`
  Z when<Z>({
    @required Z Function(T) success,
    @required Z Function(Object, StackTrace) failure,
  }) {
    if (this is Failure) {
      final b = this as Failure;
      return failure(b.e, b.s);
    } else {
      try {
        return success((this as Success).data);
      } on Exception catch (e, s) {
        return failure(e, s);
      }
    }
  }
}
