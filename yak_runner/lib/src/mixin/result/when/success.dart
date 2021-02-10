import 'package:meta/meta.dart';
import '../../../classes/all.dart';

/// a `mixin` on `SuccessBase`
mixin WhenSuccess<T> on SuccessBase<T> {
  ///  `when` implementation in case `Result` is `Success`
  Z when<Z>({
    @required Z Function(T) success,
    @required Z Function(Object, StackTrace) failure,
  }) {
    if (this is Success) {
      return success((this as Success).data);
    } else {
      try {
        final b = this as Failure;
        return failure(b.e, b.s);
      } on Exception catch (e, s) {
        return failure(e, s);
      }
    }
  }
}
