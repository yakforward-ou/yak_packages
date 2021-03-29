import 'dart:async';
import 'package:stub/stub.dart';
import 'package:yak_runner/yak_runner.dart';

class MockRunnerTestDelegate<T> extends Stub<void>
    implements RunnerTestDelegate<T> {
  @override
  void call(FutureOr<T> result) => stub();
}
