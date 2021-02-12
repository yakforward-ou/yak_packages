import 'dart:async';

/// a delegate for compatibility with [https://pub.dev/packages/yak_test]
/// or 3rd party custom implementation
mixin YakRunnerArgTestDelegate<T, S> {
  /// `call` will run the test
  void call(FutureOr<T> result, FutureOr<S> arg);
}
