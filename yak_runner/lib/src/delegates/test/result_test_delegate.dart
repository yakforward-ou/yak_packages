import 'dart:async';

mixin ResultTestDelegate<T> {
  void call(FutureOr<T> result);
}
