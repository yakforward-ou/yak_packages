import 'dart:async';
import 'package:stub/stub.dart';
import 'package:yak_runner/yak_runner.dart';

class MockRunnerTestDelegate<T> implements RunnerTestDelegate<T> {
  final stub = unaryStub<void, T>();

  @override
  void call(FutureOr<T> result) async => stub.wrap(await result);
}
