import 'dart:async';
import 'package:stub/stub.dart';
import 'package:yak_runner/yak_runner.dart';

class MockUnaryRunnerTestDelegate<T, S> extends Stub<void>
    implements UnaryRunnerTestDelegate<T, S> {
  @override
  void call(FutureOr<T> result, FutureOr<S> arg) => stub();
}
