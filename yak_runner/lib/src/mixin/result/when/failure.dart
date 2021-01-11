import 'package:meta/meta.dart';
import '../../../classes/all.dart';

mixin WhenFailure<T> on FailureBase<T> {
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
      } catch (e, s) {
        return failure(e, s);
      }
    }
  }
}
