import 'dart:async';

import 'package:yak_runner/yak_runner.dart';

class FakeNullaryTest<T> implements RunnerTestDelegate<T> {
  const FakeNullaryTest();
  @override
  void call(FutureOr<T> result) {}
}
