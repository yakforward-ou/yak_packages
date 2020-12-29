import 'dart:async';

mixin ArgResultTestDelegate<T, S> {
  void call(FutureOr<T> result, FutureOr<S> arg);
}
