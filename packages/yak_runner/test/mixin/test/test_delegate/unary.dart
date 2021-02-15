import 'dart:async';

import 'package:yak_runner/yak_runner.dart';

class FakeUnaryTest<T, S> implements YakRunnerArgTestDelegate<T, S> {
  const FakeUnaryTest();

  @override
  void call(FutureOr<T> result, FutureOr<S> arg) {}
}
