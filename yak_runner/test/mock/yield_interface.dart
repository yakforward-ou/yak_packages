import 'dart:async';

abstract class YakAsyncYieldInterface<T> {
  Future<T> call();
}

abstract class YakYieldInterface<T> {
  T call();
}
