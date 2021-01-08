import 'dart:async';

mixin YakRunnerArgTestDelegate<T, S> {
  void call(FutureOr<T> result, FutureOr<S> arg);
}
