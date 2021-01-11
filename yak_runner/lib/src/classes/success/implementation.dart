import 'package:yak_runner/src/mixin/all.dart';

import 'base.dart';
import '../../mixin/all.dart';

class Success<T> extends SuccessBase<T>
    with WhenSuccess<T>, OnSuccess<T>, OnSuccessAsync<T> {
  const Success(T data) : super(data);
}
