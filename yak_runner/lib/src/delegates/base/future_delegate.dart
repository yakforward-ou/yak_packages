import 'dart:async';

mixin FutureDelegate<T> {
  FutureOr<T> call();
}
