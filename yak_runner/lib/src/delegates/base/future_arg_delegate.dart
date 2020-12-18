import 'dart:async';

mixin FutureArgDelegate<T, S> {
  Future<T> call(FutureOr<S> arg);
}
