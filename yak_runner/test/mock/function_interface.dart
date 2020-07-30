import 'dart:async';

abstract class YakAsyncFunctionInterface<T, S> {
  Future<T> call(FutureOr<S> argument);
}

abstract class YakFunctionInterface<T, S> {
  T call(S argument);
}
