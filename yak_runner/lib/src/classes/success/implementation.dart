import 'base.dart';
import '../../mixin/when/all.dart';

class Success<T> extends SuccessBase<T> with WhenSuccess<T> {
  const Success(T data) : super(data);
}
