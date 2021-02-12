import '../../mixin/all.dart';
import 'base.dart';

/// class extending `SuccessBase`
class Success<T> extends SuccessBase<T>
    with WhenSuccess<T>, OnSuccess<T>, OnSuccessAsync<T> {
  /// `T` `data` stores the value of a `SuccessBase`
  const Success(T data) : super(data);
}
