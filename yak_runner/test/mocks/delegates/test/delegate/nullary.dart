import 'dart:async';

mixin YakRunnerTestDelegate<T> {
  void call(FutureOr<T> result);
}
