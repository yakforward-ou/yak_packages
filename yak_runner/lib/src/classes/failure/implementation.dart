import 'package:yak_runner/src/mixin/all.dart';

import '../../mixin/when/all.dart';
import 'base.dart';

class Failure<T> extends FailureBase<T> with WhenFailure<T>, OnFailure<T> {
  const Failure(Object e, StackTrace s) : super(e, s);
}
