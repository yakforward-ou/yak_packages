import 'package:meta/meta.dart';
import '../../../classes/all.dart';

mixin WhenSuccess<T> on SuccessBase<T> {
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
      } catch (e, s) {
        return failure(e, s);
      }
    }
  }
}
